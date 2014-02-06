require 'spec_helper'

describe Marvelite::API::Router do
  context 'initialization' do
    it 'accepts an :api_version as param' do
      router = Marvelite::API::Router.new(:api_version => 'v1')
      expect(router.api_version).to eq('v1')
    end

    it ':api_version defaults to v1' do
      router = Marvelite::API::Router.new
      expect(router.api_version).to eq('v1')
    end

    it 'loads a YAML config file matching the :api_version attribute'

    it 'calls #add_route for each route defined in YAML routes file'

    it 'calls #map_routes'
  end

  describe '#add_route' do
    it 'adds a new route to the routes variable'
  end

  describe '#map_routes' do
    it 'adds all routes as methods to the router'
  end

end