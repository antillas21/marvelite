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
  end

  it 'stores Marvel Comics API endpoints'
end