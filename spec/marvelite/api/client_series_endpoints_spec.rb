require 'spec_helper'

describe Marvelite::API::Client do
  context "Series Endpoints" do
    let(:client) { marvelite_test_client }

    describe '#series' do
      before do
        stub_get('series?apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'series/series.json')
      end

      it 'returns a Marvelite::API::Response object' do
        expect(client.series).to be_a(Marvelite::API::Response)
      end

      it 'Response object is populated with JSON from the /series endpoint' do
        expect(client.series["status"]).to eq("Ok")
        expect(client.series[:data][:results].size).to eq(20)
      end
    end

    describe '#serie' do
      before do
        stub_get('series/2069?apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'series/serie.json')
        stub_get('series?title=Spider-Man!&apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'series/serie.json')
      end
      it 'returns a Marvelite::API::Response object' do
        expect(client.serie(2069)).to be_a(Marvelite::API::Response)
      end

      it 'Response object is populated with JSON from the /series/:id endpoint' do
        expect(client.serie(2069)[:data][:results][0][:title]).to eq('Spider-Man (1990 - 1998)')
      end

      it 'accepts an Integer as series id' do
        expect(client.serie(2069)[:data][:results][0][:title]).to eq('Spider-Man (1990 - 1998)')
      end
    end

    describe '#series_characters' do
      before do
        stub_get('series/2069/characters?apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'series/series_characters.json')
      end

      it 'returns a Marvelite::API::Response object' do
        expect(client.series_characters(2069)).to be_a(Marvelite::API::Response)
      end

      it 'Response object is populated with JSON from the /series/:id/characters endpoint' do
        expect(client.series_characters(2069)["status"]).to eq("Ok")
        expect(client.series_characters(2069)[:data][:results].size).to eq(16)
      end

      it 'accepts an Integer as series id' do
        expect(client.series_characters(2069)[:data][:results][0][:name]).to eq('Adam Warlock')
      end
    end

    describe '#series_comics' do
      before do
        stub_get('series/2069/comics?apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'series/series_comics.json')
      end

      it 'returns a Marvelite::API::Response object' do
        expect(client.series_comics(2069)).to be_a(Marvelite::API::Response)
      end

      it 'Response object is populated with JSON from the /series/:id/comics endpoint' do
        expect(client.series_comics(2069)["status"]).to eq("Ok")
        expect(client.series_comics(2069)[:data][:results].size).to eq(20)
      end

      it 'accepts an Integer as series id' do
        expect(client.series_comics(2069)[:data][:results][0][:title]).to eq('Spider-Man (1990) #98')
      end
    end

    describe '#series_creators' do
      before do
        stub_get('series/2069/creators?apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'series/series_creators.json')
      end

      it 'returns a Marvelite::API::Response object' do
        expect(client.series_creators(2069)).to be_a(Marvelite::API::Response)
      end

      it 'Response object is populated with JSON from the /series/:id/creators endpoint' do
        expect(client.series_creators(2069)["status"]).to eq("Ok")
        expect(client.series_creators(2069)[:data][:results].size).to eq(20)
      end

      it 'accepts an Integer as series id' do
        expect(client.series_creators(2069)[:data][:results][0][:fullName]).to eq('Comicraft')
      end
    end

    describe '#series_events' do
      before do
        stub_get('series/2069/events?apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'series/series_events.json')
      end

      it 'returns a Marvelite::API::Response object' do
        expect(client.series_events(2069)).to be_a(Marvelite::API::Response)
      end

      it 'Response object is populated with JSON from the /series/:id/events endpoint' do
        expect(client.series_events(2069)["status"]).to eq("Ok")
        expect(client.series_events(2069)[:data][:results].size).to eq(3)
      end

      it 'accepts an Integer as series id' do
        expect(client.series_events(2069)[:data][:results][0][:title]).to eq('Infinity War')
      end
    end

    describe '#series_stories' do
      before do
        stub_get('series/2069/stories?apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'series/series_stories.json')
      end

      it 'returns a Marvelite::API::Response object' do
        expect(client.series_stories(2069)).to be_a(Marvelite::API::Response)
      end

      it 'Response object is populated with JSON from the /series/:id/stories endpoint' do
        expect(client.series_stories(2069)["status"]).to eq("Ok")
        expect(client.series_stories(2069)[:data][:results].size).to eq(20)
      end

      it 'accepts an Integer as series id' do
        expect(client.series_stories(2069)[:data][:results][0][:title]).to eq('Cover #23741')
      end
    end
  end
end