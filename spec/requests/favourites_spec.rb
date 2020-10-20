require 'rails_helper'

RSpec.describe '/favourites', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Favourite. As you add validations to Favourite, be sure to
  # adjust the attributes here as well.
  let!(:autoUser) { create(:user) }
  let!(:token) {JWT.encode({ user_id: autoUser.id }, 's3cr3t')}
  let!(:autoTech) { create(:tech, user_id: autoUser.id) }

  let(:valid_attributes) do
    # skip('Add a hash of attributes valid for your model')
    {'tech_id': autoTech.id, 'user_id': autoUser.id }
  end

  let(:invalid_attributes) do
    {'tech_id': '100', 'user_id': '100' }
  end

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # FavouritesController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) do
    {'Content-Type' => 'application/json', 'Authorization' => "Bearer #{token}"}
  end


  describe 'GET /user_favourites' do
    it 'renders a successful response and returns the favourited tech' do
      Favourite.create! valid_attributes
      get '/user_favourites', headers: valid_headers, as: :json
      expect(response).to be_successful
      expect(response.body).to match(/"id":#{autoTech.id}/)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Favourite' do
        expect do
          post favourites_url,
               params: { favourite: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Favourite, :count).by(1)
      end

      it 'renders a JSON response with the new favourite' do
        post favourites_url,
             params: { favourite: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.body).to match(/"id":#{autoTech.id}/)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Favourite' do
        expect do
          post favourites_url,
               params: { favourite: invalid_attributes }, as: :json
        end.to change(Favourite, :count).by(0)
      end

      it 'renders a JSON response with errors for the new favourite' do
        post favourites_url,
             params: { favourite: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to match(/must exist/)
      end
    end
  end


  describe 'DELETE /destroy' do
    it 'destroys the requested favourite' do
      favourite = Favourite.create! valid_attributes
      expect do
        delete favourite_url(favourite.tech_id), headers: valid_headers, as: :json
      end.to change(Favourite, :count).by(-1)
    end
  end
end
