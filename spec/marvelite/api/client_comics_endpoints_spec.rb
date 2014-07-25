require 'spec_helper'

describe Marvelite::API::Client do
  context "Comics Endpoints" do
    let(:client) { marvelite_test_client }

    describe '#comics' do
      before do
        stub_get('comics?apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'comics/comics.json')
      end

      it 'returns a Marvelite::API::Response object' do
        expect(client.comics).to be_a(Marvelite::API::Response)
      end

      it 'Response object is populated with JSON from the /comics endpoint' do
        expect(client.comics["status"]).to eq("Ok")
        expect(client.comics[:data][:results].size).to eq(20)
      end
    end

    describe '#comic' do
      before do
        stub_get('comics/40128?apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'comics/comic.json')
      end
      it 'returns a Marvelite::API::Response object' do
        expect(client.comic(40128)).to be_a(Marvelite::API::Response)
      end

      it 'Response object is populated with JSON from the /comics/:id endpoint' do
        expect(client.comic(40128)[:data][:results][0][:title]).to eq('Amazing Spider-Man (1999) #700')
      end

      it 'accepts an Integer as comic id' do
        expect(client.comic(40128)[:data][:results][0][:title]).to eq('Amazing Spider-Man (1999) #700')
      end
    end

    describe '#comic_characters' do
      before do
        stub_get('comics/40128/characters?apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'comics/comic_characters.json')
      end

      it 'returns a Marvelite::API::Response object' do
        expect(client.comic_characters(40128)).to be_a(Marvelite::API::Response)
      end

      it 'Response object is populated with JSON from the /comics/:id/characters endpoint' do
        expect(client.comic_characters(40128)["status"]).to eq("Ok")
        expect(client.comic_characters(40128)[:data][:results].size).to eq(1)
      end

      it 'accepts an Integer as comic id' do
        expect(client.comic_characters(40128)[:data][:results][0][:name]).to eq('Spider-Man')
      end
    end

    describe '#comic_events' do
      before do
        stub_get('comics/40128/events?apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'comics/comic_events.json')
      end

      it 'returns a Marvelite::API::Response object' do
        expect(client.comic_events(40128)).to be_a(Marvelite::API::Response)
      end

      it 'Response object is populated with JSON from the /comics/:id/events endpoint' do
        expect(client.comic_events(40128)["status"]).to eq("Ok")
        expect(client.comic_events(40128)[:data][:results].size).to eq(1)
      end

      it 'accepts an Integer as comic id' do
        expect(client.comic_events(40128)[:data][:results][0][:title]).to eq('Avengers VS X-Men')
      end
    end

    describe '#comic_creators' do
      before do
        stub_get('comics/40128/creators?apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'comics/comic_creators.json')
      end

      it 'returns a Marvelite::API::Response object' do
        expect(client.comic_creators(40128)).to be_a(Marvelite::API::Response)
      end

      it 'Response object is populated with JSON from the /comics/:id/creators endpoint' do
        expect(client.comic_creators(40128)["status"]).to eq("Ok")
        expect(client.comic_creators(40128)[:data][:results].size).to eq(12)
      end

      it 'accepts an Integer as comic id' do
        expect(client.comic_creators(40128)[:data][:results][0][:fullName]).to eq('Sal Buscema')
      end
    end

    describe '#comic_stories' do
      before do
        stub_get('comics/40128/stories?apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'comics/comic_stories.json')
      end

      it 'returns a Marvelite::API::Response object' do
        expect(client.comic_stories(40128)).to be_a(Marvelite::API::Response)
      end

      it 'Response object is populated with JSON from the /comics/:id/stories endpoint' do
        expect(client.comic_stories(40128)["status"]).to eq("Ok")
        expect(client.comic_stories(40128)[:data][:results].size).to eq(2)
      end

      it 'accepts an Integer as comic id' do
        expect(client.comic_stories(40128)[:data][:results][0][:title]).to eq('Cover #91053')
      end
    end
  end
end