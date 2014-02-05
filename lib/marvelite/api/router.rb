module Marvelite
  module API
    class Router
      attr_accessor :api_version

      def initialize(attrs = {})
        @api_version = attrs.fetch(:api_version) { 'v1' }
      end

      def characters_path
        "/#{api_version}/public/characters"
      end

      def character_path(id)
        "/#{api_version}/public/characters/#{id}"
      end

      def character_comics_path(id)
        "/#{api_version}/public/characters/#{id}/comics"
      end

      def character_events_path(id)
        "/#{api_version}/public/characters/#{id}/events"
      end

      def character_series_path(id)
        "/#{api_version}/public/characters/#{id}/series"
      end

      def character_stories_path(id)
        "/#{api_version}/public/characters/#{id}/stories"
      end

      def comics_path
        "/#{api_version}/public/comics"
      end

      def comic_path(id)
        "/#{api_version}/public/comics/#{id}"
      end

      def comic_characters_path(id)
        "/#{api_version}/public/comics/#{id}/characters"
      end

      def comic_creators_path(id)
        "/#{api_version}/public/comics/#{id}/creators"
      end

      def comic_events_path(id)
        "/#{api_version}/public/comics/#{id}/events"
      end

      def comic_stories_path(id)
        "/#{api_version}/public/comics/#{id}/stories"
      end
    end
  end
end