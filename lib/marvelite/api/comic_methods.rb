module Marvelite
  module API
    module ComicMethods
      def comics(query_params = {})
        response = self.class.get(router.comics_path, :query => params(query_params))
        build_response_object(response)
      end

      def comic(id)
        response = self.class.get(router.comic_path(id), :query => params)
        build_response_object(response)
      end

      def comic_characters(id, query_params = {})
        response = self.class.get(router.comic_characters_path(id), :query => params(query_params))
        build_response_object(response)
      end

      def comic_events(id, query_params = {})
        response = self.class.get(router.comic_events_path(id), :query => params(query_params))
        build_response_object(response)
      end

      def comic_creators(id, query_params = {})
        response = self.class.get(router.comic_creators_path(id), :query => params(query_params))
        build_response_object(response)
      end
      
      def comic_stories(id, query_params = {})
        response = self.class.get(router.comic_stories_path(id), :query => params(query_params))
        build_response_object(response)
      end
    end
  end
end