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
          client = Marvelite::API::Client.new(:public_key => '1234', :private_key => 'abcd', :api_version => 'v1')
          expect(client.api_version).to eq('v1')
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
end