require 'rails_helper'

RSpec.describe FavouritesController, type: :routing do
  describe 'routing' do

    it 'routes to #user_favourites' do
      expect(get: '/user_favourites').to route_to('favourites#user_favourites')
    end

    it 'routes to #create' do
      expect(post: '/favourites').to route_to('favourites#create')
    end

    it 'routes to #destroy' do
      expect(delete: '/favourites/1').to route_to('favourites#destroy', id: '1')
    end
  end
end
