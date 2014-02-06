module Marvelite
  module API
    module EventMethods
      def events(query_params = {})
        response = self.class.get(router.events_path, :query => params(query_params))
        build_response_object(response)
      end

      def event(id)
        response = self.class.get(router.event_path(:id => id), :query => params)
        build_response_object(response)
      end

      def event_characters(id, query_params = {})
        response = self.class.get(router.event_characters_path(:id => id), :query => params(query_params))
        build_response_object(response)
      end

      def event_comics(id, query_params = {})
        response = self.class.get(router.event_comics_path(:id => id), :query => params(query_params))
        build_response_object(response)
      end

      def event_creators(id, query_params = {})
        response = self.class.get(router.event_creators_path(:id => id), :query => params(query_params))
        build_response_object(response)
      end
      
      def event_series(id, query_params = {})
        response = self.class.get(router.event_series_path(:id => id), :query => params(query_params))
        build_response_object(response)
      end

      def event_stories(id, query_params = {})
        response = self.class.get(router.event_stories_path(:id => id), :query => params(query_params))
        build_response_object(response)
      end
    end
  end
end