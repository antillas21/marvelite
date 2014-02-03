module Marvelite
  module API
    class Client
      include ActiveModel::Model
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

      def characters(query_params = {})
        response = self.class.get("/#{api_version}/#{router.characters_path}", :query => params(query_params))
        Response.new(response)
      end

      def character(value)
        by_name = value.is_a?(String) ? true : false
        response = if by_name
          self.characters(:name => value)
        else
          self.class.get("/#{api_version}/#{router.character_path(value)}", :query => params)
        end

        Response.new(response)
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
    end
  end
end