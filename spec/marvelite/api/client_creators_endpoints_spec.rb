require 'spec_helper'

describe Marvelite::API::Client do
  context "Creators Endpoints" do
    let(:client) { marvelite_test_client }

    describe '#creators' do
      before do
        stub_get('creators?apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'creators/creators.json')
      end

      it 'returns a Marvelite::API::Response object' do
        expect(client.creators).to be_a(Marvelite::API::Response)
      end

      it 'Response object is populated with JSON from the creators endpoint' do
        expect(client.creators["status"]).to eq("Ok")
        expect(client.creators[:data][:results].size).to eq(20)
      end
    end

    describe '#creator' do
      before do
        stub_get('creators/593?apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'creators/creator.json')
        stub_get('creators/4781?apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'creators/creator_2.json')
      end

      it 'returns a Marvelite::API::Response object' do
        expect(client.creator(593)).to be_a(Marvelite::API::Response)
      end

      it 'Response object is populated with JSON from the creator endpoint' do
        expect(client.creator(593)[:data][:results][0][:lastName]).to eq('Loughridge')
      end

      it 'accepts an Integer as creator id' do
        expect(client.creator(593)[:data][:results][0][:firstName]).to eq('Lee')
        expect(client.creator(4781)[:data][:results][0][:firstName]).to eq('Barta')
      end
    end
  end
end
