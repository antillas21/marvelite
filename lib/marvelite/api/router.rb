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

      def character_stories_path(id)
        "public/characters/#{id}/stories"
      end
    end
  end
end