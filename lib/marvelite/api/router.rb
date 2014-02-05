module Marvelite
  module API
    class Router
      def characters_path
        'public/characters'
      end

      def character_path(id)
        "public/characters/#{id}"
      end

      def character_comics_path(id)
        "public/characters/#{id}/comics"
      end

      def character_events_path(id)
        "public/characters/#{id}/events"
      end

      def character_series_path(id)
        "public/characters/#{id}/series"
      end

      def character_stories_path(id)
        "public/characters/#{id}/stories"
      end

      def comics_path
        "public/comics"
      end

      def comic_path(id)
        "public/comics/#{id}"
      end

      def comic_characters_path(id)
        "public/comics/#{id}/characters"
      end

      def comic_creators_path(id)
        "public/comics/#{id}/creators"
      end

      def comic_events_path(id)
        "public/comics/#{id}/events"
      end

      def comic_stories_path(id)
        "public/comics/#{id}/stories"
      end
    end
  end
end