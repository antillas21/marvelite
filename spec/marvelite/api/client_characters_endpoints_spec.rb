require 'spec_helper'

describe Marvelite::API::Client do
  context "Characters Endpoints" do
    let(:client) { marvelite_test_client }

    describe '#characters' do
      before do
        stub_get('characters?apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'characters/characters.json')
      end

      it 'returns a Marvelite::API::Response object' do
        expect(client.characters).to be_a(Marvelite::API::Response)
      end

      it 'Response object is populated with JSON from the /characters endpoint' do
        expect(client.characters["status"]).to eq("Ok")
        expect(client.characters[:data][:results].size).to eq(20)
      end
    end

    describe '#character' do
      before do
        stub_get('characters?name=Spider-Man&apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'characters/character.json')
        stub_get('characters/1009610?apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'characters/character.json')
        stub_get('characters/1009227?apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'characters/character_2.json')
      end
      it 'returns a Marvelite::API::Response object' do
        expect(client.character(1009610)).to be_a(Marvelite::API::Response)
      end

      it 'Response object is populated with JSON from the /characters/:id endpoint' do
        expect(client.character(1009610)[:data][:results][0][:name]).to eq('Spider-Man')
      end

      it 'accepts an Integer as character id' do
        expect(client.character(1009610)[:data][:results][0][:name]).to eq('Spider-Man')
        expect(client.character(1009227)[:data][:results][0][:name]).to eq('Carnage')
      end

      it 'accepts a String as character name' do
        expect(client.character('Spider-Man')[:data][:results][0][:name]).to eq('Spider-Man')
      end
    end

    describe '#character_comics' do
      before do
        stub_get('characters/1009610/comics?apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'characters/character_comics.json')
      end

      it 'returns a Marvelite::API::Response object' do
        expect(client.character_comics(1009610)).to be_a(Marvelite::API::Response)
      end

      it 'Response object is populated with JSON from the /characters/:id/comics endpoint' do
        expect(client.character_comics(1009610)["status"]).to eq("Ok")
        expect(client.character_comics(1009610)[:data][:results].size).to eq(20)
      end

      it 'accepts an Integer as character id' do
        expect(client.character_comics(1009610)[:data][:results][0][:title]).to eq('Superior Spider-Man (2013) #22')
      end

      it 'accepts a String as character id' do
        expect(client.character_comics('Spider-Man')["status"]).to eq("Ok")
        expect(client.character_comics('Spider-Man')[:data][:results].size).to eq(20)
      end
    end

    describe '#character_events' do
      before do
        stub_get('characters/1009610/events?apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'characters/character_events.json')
      end

      it 'returns a Marvelite::API::Response object' do
        expect(client.character_events(1009610)).to be_a(Marvelite::API::Response)
      end

      it 'Response object is populated with JSON from the /characters/:id/events endpoint' do
        expect(client.character_events(1009610)["status"]).to eq("Ok")
        expect(client.character_events(1009610)[:data][:results].size).to eq(20)
      end

      it 'accepts an Integer as character id' do
        expect(client.character_events(1009610)[:data][:results][0][:title]).to eq('Acts of Vengeance!')
      end

      it 'accepts a String as character id' do
        expect(client.character_comics('Spider-Man')["status"]).to eq("Ok")
        expect(client.character_comics('Spider-Man')[:data][:results].size).to eq(20)
      end
    end

    describe '#character_series' do
      before do
        stub_get('characters/1009610/series?apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'characters/character_series.json')
      end

      it 'returns a Marvelite::API::Response object' do
        expect(client.character_series(1009610)).to be_a(Marvelite::API::Response)
      end

      it 'Response object is populated with JSON from the /characters/:id/series endpoint' do
        expect(client.character_series(1009610)["status"]).to eq("Ok")
        expect(client.character_series(1009610)[:data][:results].size).to eq(20)
      end

      it 'accepts an Integer as character id' do
        expect(client.character_series(1009610)[:data][:results][0][:title]).to eq('A+X (2012 - Present)')
      end

      it 'accepts a String as character id' do
        expect(client.character_comics('Spider-Man')["status"]).to eq("Ok")
        expect(client.character_comics('Spider-Man')[:data][:results].size).to eq(20)
      end
    end

    describe '#character_stories' do
      before do
        stub_get('characters?name=Spider-Man&apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'characters/character.json')
        stub_get('characters/1009610/stories?apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'characters/character_stories.json')
      end

      it 'returns a Marvelite::API::Response object' do
        expect(client.character_stories(1009610)).to be_a(Marvelite::API::Response)
      end

      it 'Response object is populated with JSON from the /characters/:id/stories endpoint' do
        expect(client.character_stories(1009610)["status"]).to eq("Ok")
        expect(client.character_stories(1009610)[:data][:results].size).to eq(20)
      end

      it 'accepts an Integer as character id' do
        expect(client.character_stories(1009610)[:data][:results][0][:title]).to eq('Interior #483')
      end
      
      it 'accepts a String as character id' do
        expect(client.character_comics('Spider-Man')["status"]).to eq("Ok")
        expect(client.character_comics('Spider-Man')[:data][:results].size).to eq(20)
      end
    end
  end
end