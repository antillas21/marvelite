require 'spec_helper'

describe Marvelite::API::Client do
  describe 'initialization' do
    it 'requires a :public_key to be set' do
      expect{ Marvelite::API::Client.new(:private_key => '12345') }.to raise_error(
        Marvelite::API::Client::InvalidClientError, "You need to provide a :public_key param."
      )
    end

    it 'requires a :private_key to be set' do
      expect{ Marvelite::API::Client.new(:public_key => '1234') }.to raise_error(
        Marvelite::API::Client::InvalidClientError, "You need to provide a :private_key param."
      )
    end

    context 'valid' do
      let(:client) { Marvelite::API::Client.new(:public_key => '1234', :private_key => 'abcd') }

      describe '#api_version' do
        it 'receives an :api_version optional param' do
          client = Marvelite::API::Client.new(
            :public_key => '1234', :private_key => 'abcd', :api_version => 'v1'
          )
          expect(client.api_version).to eq('v1')
        end

        it 'defaults to v1' do
          expect(client.api_version).to eq('v1')
        end
      end

      it 'is an instance of Marvelite::Client' do
        expect{ client }.to_not raise_error
        expect(client).to be_a(Marvelite::API::Client)
      end

      it 'has an API Router instance in its config' do
        expect(client.router).to_not be_nil
        expect(client.router).to be_a(Marvelite::API::Router)
      end
    end
  end

  describe 'etags' do
    let(:client) { marvelite_test_client }
    let(:etag) { '64aceb407b735957130fce343bf4933ed21a7cfc' }

    before do
      stub_304('series?apikey=123456&ts=1&hash=d4f1bab013916a533ef31e3ad5fb0887', etag)
    end

    it 'returns a NotModifiedResponse' do
      headers = { 'If-None-Match' => "\"#{etag}\"" }
      response = client.series(headers: headers)

      expect(response).to be_a Marvelite::API::NotModifiedResponse
      expect(response.code).to eq(304)
      expect(response.status).to eq("Not Modified")
      expect(response.etag).to eq(etag)
      expect(response.data).to eq({})
    end
  end

  describe 'gzip compression support' do
    let(:client) { marvelite_test_client }
    let(:options) { {:id => 123} }

    it 'is enabled by default' do
      expect(client.send(:pull_headers, options)).to eq(
        [{ :id => 123 }, { 'Accept-Encoding' => 'gzip' }]
      )
    end

    it 'can be passed in explicitely' do
      gzip_options = { :id => 234, :headers => { 'Accept-Encoding' => 'gzip' } }
      expect(client.send(:pull_headers, gzip_options)).to eq(
        [{ :id => 234 }, { 'Accept-Encoding' => 'gzip' }]
      )
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
        expect(client.send(:params)).to eq(
          {:apikey => client.public_key, :ts => '1', :hash => 'ffd275c5130566a2916217b101f26150'}
        )
      end
    end
  end
end
