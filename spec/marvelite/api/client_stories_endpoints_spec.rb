require 'spec_helper'

describe Marvelite::API::Client do
  context "Stories Endpoints" do
    let(:client) { marvelite_test_client }

    describe '#stories' do
      before do
        stub_get('stories?apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'stories/stories.json')
      end

      it 'returns a Marvelite::API::Response object' do
        expect(client.stories).to be_a(Marvelite::API::Response)
      end

      it 'Response object is populated with JSON from the /stories endpoint' do
        expect(client.stories["status"]).to eq("Ok")
        expect(client.stories[:data][:results].size).to eq(20)
      end
    end

    describe '#story' do
      before do
        stub_get('stories/2210?apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'stories/story.json')
      end
      it 'returns a Marvelite::API::Response object' do
        expect(client.story(2210)).to be_a(Marvelite::API::Response)
      end

      it 'Response object is populated with JSON from the /stories/:id endpoint' do
        expect(client.story(2210)[:data][:results][0][:title]).to eq('2 of 3 - House of M')
      end

      it 'accepts an Integer as story id' do
        expect(client.story(2210)[:data][:results][0][:title]).to eq('2 of 3 - House of M')
      end
    end

    describe '#story_characters' do
      before do
        stub_get('stories/2210/characters?apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'stories/story_characters.json')
      end

      it 'returns a Marvelite::API::Response object' do
        expect(client.story_characters(2210)).to be_a(Marvelite::API::Response)
      end

      it 'Response object is populated with JSON from the /stories/:id/characters endpoint' do
        expect(client.story_characters(2210)["status"]).to eq("Ok")
        expect(client.story_characters(2210)[:data][:results].size).to eq(3)
      end

      it 'accepts an Integer as story id' do
        expect(client.story_characters(2210)[:data][:results][0][:name]).to eq('Mystique (House of M)')
      end
    end

    describe '#story_comics' do
      before do
        stub_get('stories/2210/comics?apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'stories/story_comics.json')
      end

      it 'returns a Marvelite::API::Response object' do
        expect(client.story_comics(2210)).to be_a(Marvelite::API::Response)
      end

      it 'Response object is populated with JSON from the /stories/:id/comics endpoint' do
        expect(client.story_comics(2210)["status"]).to eq("Ok")
        expect(client.story_comics(2210)[:data][:results].size).to eq(1)
      end

      it 'accepts an Integer as story id' do
        expect(client.story_comics(2210)[:data][:results][0][:title]).to eq('Wolverine (2003) #34')
      end
    end

    describe '#story_creators' do
      before do
        stub_get('stories/2210/creators?apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'stories/story_creators.json')
      end

      it 'returns a Marvelite::API::Response object' do
        expect(client.story_creators(2210)).to be_a(Marvelite::API::Response)
      end

      it 'Response object is populated with JSON from the /stories/:id/creators endpoint' do
        expect(client.story_creators(2210)["status"]).to eq("Ok")
        expect(client.story_creators(2210)[:data][:results].size).to eq(1)
      end

      it 'accepts an Integer as story id' do
        expect(client.story_creators(2210)[:data][:results][0][:fullName]).to eq('Kaare Andrews')
      end
    end

    describe '#story_events' do
      before do
        stub_get('stories/2210/events?apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'stories/story_events.json')
      end

      it 'returns a Marvelite::API::Response object' do
        expect(client.story_events(2210)).to be_a(Marvelite::API::Response)
      end

      it 'Response object is populated with JSON from the /stories/:id/events endpoint' do
        expect(client.story_events(2210)["status"]).to eq("Ok")
        expect(client.story_events(2210)[:data][:results].size).to eq(1)
      end

      it 'accepts an Integer as story id' do
        expect(client.story_events(2210)[:data][:results][0][:title]).to eq('House of M')
      end
    end

    describe '#story_series' do
      before do
        stub_get('stories/2210/series?apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'stories/story_series.json')
      end

      it 'returns a Marvelite::API::Response object' do
        expect(client.story_series(2210)).to be_a(Marvelite::API::Response)
      end

      it 'Response object is populated with JSON from the /stories/:id/series endpoint' do
        expect(client.story_series(2210)["status"]).to eq("Ok")
        expect(client.story_series(2210)[:data][:results].size).to eq(1)
      end

      it 'accepts an Integer as story id' do
        expect(client.story_series(2210)[:data][:results][0][:title]).to eq('Wolverine (2003 - 2009)')
      end
    end
  end
end