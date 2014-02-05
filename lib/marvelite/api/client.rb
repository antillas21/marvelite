module Marvelite
  module API
    class Client
      include ActiveModel::Model
      
      include Marvelite::API::CharacterMethods
      include Marvelite::API::ComicMethods

      include HTTParty
      base_uri 'http://gateway.marvel.com'

      attr_accessor :public_key, :private_key, :router, :api_version

      validates_presence_of :public_key
      validates_presence_of :private_key

      def initialize(attrs)
        super
        @router = attrs.fetch(:router) { Marvelite.router }
        @api_version = attrs.fetch(:api_version) { 'v1' }
      end

      private
      def params(additional_params = {})
        base_hash = { :apikey => public_key, :ts => ts, :hash => request_hash }
        additional_params.merge(base_hash)
      end

      def request_hash
        Digest::MD5.hexdigest("#{ts}#{private_key}#{public_key}")
      end

      def ts
        begin
          Time.now.to_i
        end
      end

      def find_character_by_name(name)
        response = self.characters(:name => name)
        return false unless response[:data][:results].size > 0

        response.id = response[:data][:results][0][:id]
        response
      end

      def build_response_object(response)
        case response["code"]
        when 200
          Response.new(response)
        else
          ErrorResponse.new(response)
        end
      end
    end
  end
end