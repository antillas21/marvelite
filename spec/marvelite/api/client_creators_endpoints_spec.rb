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

      it 'Response object is populated with JSON from the /creators endpoint' do
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

      it 'Response object is populated with JSON from the /creators/:id endpoint' do
        expect(client.creator(593)[:data][:results][0][:lastName]).to eq('Loughridge')
      end

      it 'accepts an Integer as creator id' do
        expect(client.creator(593)[:data][:results][0][:firstName]).to eq('Lee')
        expect(client.creator(4781)[:data][:results][0][:firstName]).to eq('Barta')
      end
    end

    describe '#creator_comics' do
      before do
        stub_get('creators/593/comics?apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'creators/creator_comics.json')
      end

      it 'returns a Marvelite::API::Response object' do
        expect(client.creator_comics(593)).to be_a(Marvelite::API::Response)
      end

      it 'Response object is populated with JSON from the /creators/:id/comics endpoint' do
        expect(client.creator_comics(593)["status"]).to eq("Ok")
        expect(client.creator_comics(593)[:data][:results].size).to eq(20)
      end

      it 'accepts an Integer as creator id' do
        expect(client.creator_comics(593)[:data][:results][0][:title]).to eq('Venom (2011) #37')
      end
    end

    describe '#creator_events' do
      before do
        stub_get('creators/593/events?apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'creators/creator_events.json')
      end

      it 'returns a Marvelite::API::Response object' do
        expect(client.creator_events(593)).to be_a(Marvelite::API::Response)
      end

      it 'Response object is populated with JSON from the /creators/:id/events endpoint' do
        expect(client.creator_events(593)["status"]).to eq("Ok")
        expect(client.creator_events(593)[:data][:results].size).to eq(2)
      end

      it 'accepts an Integer as creator id' do
        expect(client.creator_events(593)[:data][:results][0][:title]).to eq('Dark Reign')
      end
    end

    describe '#creator_series' do
      before do
        stub_get('creators/593/series?apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'creators/creator_series.json')
      end

      it 'returns a Marvelite::API::Response object' do
        expect(client.creator_series(593)).to be_a(Marvelite::API::Response)
      end

      it 'Response object is populated with JSON from the /creators/:id/series endpoint' do
        expect(client.creator_series(593)["status"]).to eq("Ok")
        expect(client.creator_series(593)[:data][:results].size).to eq(20)
      end

      it 'accepts an Integer as creator id' do
        expect(client.creator_series(593)[:data][:results][0][:title]).to eq('Age of Apocalypse (2011 - Present)')
      end
    end

    describe '#creator_stories' do
      before do
        stub_get('creators/593/stories?apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'creators/creator_stories.json')
      end

      it 'returns a Marvelite::API::Response object' do
        expect(client.creator_stories(593)).to be_a(Marvelite::API::Response)
      end

      it 'Response object is populated with JSON from the /creators/:id/stories endpoint' do
        expect(client.creator_stories(593)["status"]).to eq("Ok")
        expect(client.creator_stories(593)[:data][:results].size).to eq(20)
      end

      it 'accepts an Integer as creator id' do
        expect(client.creator_stories(593)[:data][:results][0][:title]).to eq('5 of 6 xLS')
      end
    end
  end
end
