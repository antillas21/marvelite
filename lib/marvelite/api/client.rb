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
        build_response_object(response)
      end

      def character(value)
        by_name = value.is_a?(String) ? true : false
        response = if by_name
          find_character_by_name(value)
        else
          self.class.get("/#{api_version}/#{router.character_path(value)}", :query => params)
        end

        build_response_object(response)
      end

      def character_comics(id, query_params = {})
        if id.is_a?(String)
          character = find_character_by_name(id)
          return false unless character
          id = character.id
        end

        response = self.class.get("/#{api_version}/#{router.character_comics_path(id)}", :query => params(query_params))
        build_response_object(response)
      end

      def character_events(id, query_params = {})
        if id.is_a?(String)
          character = find_character_by_name(id)
          return false unless character
          id = character.id
        end
        response = self.class.get("/#{api_version}/#{router.character_events_path(id)}", :query => params(query_params))
        build_response_object(response)
      end

      def character_series(id, query_params = {})
        if id.is_a?(String)
          character = find_character_by_name(id)
          return false unless character
          id = character.id
        end
        response = self.class.get("/#{api_version}/#{router.character_series_path(id)}", :query => params(query_params))
        build_response_object(response)
      end

      def character_stories(id, query_params = {})
        if id.is_a?(String)
          character = find_character_by_name(id)
          return false unless character
          id = character.id
        end
        response = self.class.get("/#{api_version}/#{router.character_stories_path(id)}", :query => params(query_params))
        build_response_object(response)
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