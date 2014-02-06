require 'spec_helper'

describe Marvelite::API::Client do
  context "Events Endpoints" do
    let(:client) { marvelite_test_client }

    describe '#events' do
      before do
        stub_get('events?apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'events/events.json')
      end

      it 'returns a Marvelite::API::Response object' do
        expect(client.events).to be_a(Marvelite::API::Response)
      end

      it 'Response object is populated with JSON from the events endpoint' do
        expect(client.events["status"]).to eq("Ok")
        expect(client.events[:data][:results].size).to eq(20)
      end
    end

    describe '#event' do
      before do
        stub_get('events/40128?apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'events/event.json')
      end
      it 'returns a Marvelite::API::Response object' do
        expect(client.event(40128)).to be_a(Marvelite::API::Response)
      end

      it 'Response object is populated with JSON from the event endpoint' do
        expect(client.event(40128)[:data][:results][0][:title]).to eq('Acts of Vengeance!')
      end

      it 'accepts an Integer as event id' do
        expect(client.event(40128)[:data][:results][0][:title]).to eq('Acts of Vengeance!')
      end
    end

    describe '#event_characters' do
      before do
        stub_get('events/40128/characters?apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'events/event_characters.json')
      end

      it 'returns a Marvelite::API::Response object' do
        expect(client.event_characters(40128)).to be_a(Marvelite::API::Response)
      end

      it 'Response object is populated with JSON from the events endpoint' do
        expect(client.event_characters(40128)["status"]).to eq("Ok")
        expect(client.event_characters(40128)[:data][:results].size).to eq(20)
      end

      it 'accepts an Integer as event id' do
        expect(client.event_characters(40128)[:data][:results][0][:name]).to eq('Alpha Flight')
      end
    end

    describe '#event_comics' do
      before do
        stub_get('events/40128/comics?apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'events/event_comics.json')
      end

      it 'returns a Marvelite::API::Response object' do
        expect(client.event_comics(40128)).to be_a(Marvelite::API::Response)
      end

      it 'Response object is populated with JSON from the events endpoint' do
        expect(client.event_comics(40128)["status"]).to eq("Ok")
        expect(client.event_comics(40128)[:data][:results].size).to eq(20)
      end

      it 'accepts an Integer as event id' do
        expect(client.event_comics(40128)[:data][:results][0][:title]).to eq('Avengers West Coast: Darker than Scarlet (Trade Paperback)')
      end
    end

    describe '#event_creators' do
      before do
        stub_get('events/40128/creators?apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'events/event_creators.json')
      end

      it 'returns a Marvelite::API::Response object' do
        expect(client.event_creators(40128)).to be_a(Marvelite::API::Response)
      end

      it 'Response object is populated with JSON from the events endpoint' do
        expect(client.event_creators(40128)["status"]).to eq("Ok")
        expect(client.event_creators(40128)[:data][:results].size).to eq(20)
      end

      it 'accepts an Integer as event id' do
        expect(client.event_creators(40128)[:data][:results][0][:fullName]).to eq('Jeff Albrecht')
      end
    end

    describe '#event_series' do
      before do
        stub_get('events/40128/series?apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'events/event_stories.json')
      end

      it 'returns a Marvelite::API::Response object' do
        expect(client.event_series(40128)).to be_a(Marvelite::API::Response)
      end

      it 'Response object is populated with JSON from the events endpoint' do
        expect(client.event_series(40128)["status"]).to eq("Ok")
        expect(client.event_series(40128)[:data][:results].size).to eq(20)
      end

      it 'accepts an Integer as event id' do
        expect(client.event_series(40128)[:data][:results][0][:title]).to eq('Cover #12960')
      end
    end

    describe '#event_stories' do
      before do
        stub_get('events/40128/stories?apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'events/event_stories.json')
      end

      it 'returns a Marvelite::API::Response object' do
        expect(client.event_stories(40128)).to be_a(Marvelite::API::Response)
      end

      it 'Response object is populated with JSON from the events endpoint' do
        expect(client.event_stories(40128)["status"]).to eq("Ok")
        expect(client.event_stories(40128)[:data][:results].size).to eq(20)
      end

      it 'accepts an Integer as event id' do
        expect(client.event_stories(40128)[:data][:results][0][:title]).to eq('Cover #12960')
      end
    end
  end
end