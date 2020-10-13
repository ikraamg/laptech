require 'rails_helper'

RSpec.describe FavouritesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/favourites').to route_to('favourites#index')
    end

    it 'routes to #show' do
      expect(get: '/favourites/1').to route_to('favourites#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/favourites').to route_to('favourites#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/favourites/1').to route_to('favourites#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/favourites/1').to route_to('favourites#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/favourites/1').to route_to('favourites#destroy', id: '1')
    end
  end
end
