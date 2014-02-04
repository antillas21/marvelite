require 'spec_helper'

describe Marvelite::API::Client do
  describe 'initialization' do
    it 'requires a :public_key to be set' do
      client = Marvelite::API::Client.new(:private_key => '12345')
      expect(client).to_not be_valid
    end

    it 'requires a :private_key to be set' do
      client = Marvelite::API::Client.new(:public_key => '1234')
      expect(client).to_not be_valid
    end

    context 'valid' do
      let(:client) { Marvelite::API::Client.new(:public_key => '1234', :private_key => 'abcd') }

      describe '#api_version' do
        it 'receives an :api_version optional param' do
          client = Marvelite::API::Client.new(:public_key => '1234', :private_key => 'abcd', :api_version => 'v2')
          expect(client.api_version).to eq('v2')
        end

        it 'defaults to v1' do
          expect(client.api_version).to eq('v1')
        end
      end

      it 'is an instance of Marvelite::Client' do
        expect(client).to be_valid
        expect(client).to be_a(Marvelite::API::Client)
      end

      it 'has an API Router instance in its config' do
        expect(client.router).to_not be_nil
        expect(client.router).to be_a(Marvelite::API::Router)
      end
    end
  end

  context "private methods" do
    describe '#ts' do
      let(:client) { Marvelite::API::Client.new(:public_key => '1234', :private_key => 'abcd') }

      it 'calls Time.now' do
        Time.should_receive(:now)
        client.send(:ts)
      end

      it 'represents a timestamp converted to integer' do
        expect(client.send(:ts)).to be_a(Integer)
      end
    end

    describe '#params' do
      let(:client) { Marvelite::API::Client.new(:public_key => '1234', :private_key => 'abcd') }

      it 'passes required API params to all requests' do
        client.stub(:ts).and_return('1')
        expect(client.send(:params)).to eq({:apikey => client.public_key, :ts => '1', :hash => 'ffd275c5130566a2916217b101f26150'})
      end
    end
  end


  context "Character Endpoints" do
    let(:client) { marvelite_test_client }

    describe '#characters' do
      before do
        stub_get('characters?apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'characters.json')
      end

      it 'returns a Marvelite::API::Response object' do
        expect(client.characters).to be_a(Marvelite::API::Response)
      end

      it 'Response object is populated with JSON from the characters endpoint' do
        expect(client.characters["status"]).to eq("Ok")
        expect(client.characters[:data][:results].size).to eq(20)
      end
    end

    describe '#character' do
      before do
        stub_get('characters?name=Spider-Man&apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'character.json')
        stub_get('characters/1009610?apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'character.json')
      end
      it 'returns a Marvelite::API::Response object' do
        expect(client.character(1009610)).to be_a(Marvelite::API::Response)
      end

      it 'Response object is populated with JSON from the character endpoint' do
        expect(client.character(1009610)[:data][:results][0][:name]).to eq('Spider-Man')
      end

      it 'accepts an Integer as character id' do
        expect(client.character(1009610)[:data][:results][0][:name]).to eq('Spider-Man')
      end

      it 'accepts a String as character name' do
        expect(client.character('Spider-Man')[:data][:results][0][:name]).to eq('Spider-Man')
      end
    end

    describe '#character_comics' do
      before do
        stub_get('characters/1009610/comics?apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'character_comics.json')
      end

      it 'returns a Marvelite::API::Response object' do
        expect(client.character_comics(1009610)).to be_a(Marvelite::API::Response)
      end

      it 'Response object is populated with JSON from the characters endpoint' do
        expect(client.character_comics(1009610)["status"]).to eq("Ok")
        expect(client.character_comics(1009610)[:data][:results].size).to eq(20)
      end

      it 'accepts an Integer as character id' do
        expect(client.character_comics(1009610)[:data][:results][0][:title]).to eq('Superior Spider-Man (2013) #22')
      end
    end

    describe '#character_events' do
      before do
        stub_get('characters/1009610/events?apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'character_events.json')
      end

      it 'returns a Marvelite::API::Response object' do
        expect(client.character_events(1009610)).to be_a(Marvelite::API::Response)
      end

      it 'Response object is populated with JSON from the characters endpoint' do
        expect(client.character_events(1009610)["status"]).to eq("Ok")
        expect(client.character_events(1009610)[:data][:results].size).to eq(20)
      end

      it 'accepts an Integer as character id' do
        expect(client.character_events(1009610)[:data][:results][0][:title]).to eq('Acts of Vengeance!')
      end
    end

    describe '#character_series' do
      before do
        stub_get('characters/1009610/series?apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'character_series.json')
      end

      it 'returns a Marvelite::API::Response object' do
        expect(client.character_series(1009610)).to be_a(Marvelite::API::Response)
      end

      it 'Response object is populated with JSON from the characters endpoint' do
        expect(client.character_series(1009610)["status"]).to eq("Ok")
        expect(client.character_series(1009610)[:data][:results].size).to eq(20)
      end

      it 'accepts an Integer as character id' do
        expect(client.character_series(1009610)[:data][:results][0][:title]).to eq('A+X (2012 - Present)')
      end
    end

    describe '#character_stories' do
      before do
        stub_get('characters/1009610/stories?apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', 'character_stories.json')
      end

      it 'returns a Marvelite::API::Response object' do
        expect(client.character_stories(1009610)).to be_a(Marvelite::API::Response)
      end

      it 'Response object is populated with JSON from the characters endpoint' do
        expect(client.character_stories(1009610)["status"]).to eq("Ok")
        expect(client.character_stories(1009610)[:data][:results].size).to eq(20)
      end

      it 'accepts an Integer as character id' do
        expect(client.character_stories(1009610)[:data][:results][0][:title]).to eq('Interior #483')
      end
    end
  end
end