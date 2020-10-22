require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/users', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # User. As you add validations to User, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    # skip('Add a hash of attributes valid for your model')
    { username: 'test2', email: 'test2@gmail.com', password: '123456', admin: false }
  end

  let(:invalid_attributes) do
    { email: 'test2@gmail.com', password: '123456', admin: false }
  end

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # UsersController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) do
    { 'Content-Type' => 'application/json' }
  end

  let!(:autoUser) { create(:user) }
  let!(:token) { JWT.encode({ user_id: autoUser.id }, 's3cr3t') }

  describe 'GET /auto_login' do
    it 'cannot auto_login without a correct header' do
      get '/auto_login', headers: {}, as: :json
      expect(response.body).to match(/Please log in/)
    end

    it 'auto_login with a correct header results in user returned successfully' do
      req_headers = { 'Content-Type' => 'application/json', 'Authorization' => "Bearer #{token}" }

      get '/auto_login', headers: req_headers, as: :json
      expect(response).to be_successful
      expect(ActiveSupport::JSON.decode(response.body)['id']).to eq(autoUser.id)
    end
  end

  describe 'POST /users' do
    context 'with valid parameters' do
      it 'creates a new User' do
        expect do
          post '/users',
               params: valid_attributes, headers: valid_headers, as: :json
        end.to change(User, :count).by(1)
      end

      it 'renders a JSON response with the new user' do
        post '/users',
             params: valid_attributes, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.body).to match(/test2/)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new User' do
        expect do
          post users_url,
               params: invalid_attributes, as: :json
        end.to change(User, :count).by(0)
      end

      it 'renders a JSON response with errors for the new user' do
        post users_url,
             params: invalid_attributes, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to match(/Unable to create new user/)
      end
    end
  end

  # describe 'DELETE /destroy' do
  #   it 'destroys the requested user' do
  #     expect do
  #       delete user_url(user), headers: valid_headers, as: :json
  #     end.to change(User, :count).by(-1)
  #   end
  # end
end