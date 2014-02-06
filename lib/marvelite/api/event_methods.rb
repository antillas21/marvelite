module Marvelite
  module API
    module EventMethods
      def events(query_params = {})
        response = self.class.get(router.events_path, :query => params(query_params))
        build_response_object(response)
      end

      def event(id)
        by_name = id.is_a?(String) ? true : false
        response = if by_name
          find_event_by_name(id)
        else
          # self.class.get(router.character_path(:id => value), :query => params)
          self.class.get(router.event_path(:id => id), :query => params)
        end
        build_response_object(response)
      end

      def event_characters(id, query_params = {})
        if id.is_a?(String)
          event = find_event_by_name(id)
          return false unless event
          id = event.id
        end
        response = self.class.get(router.event_characters_path(:id => id), :query => params(query_params))
        build_response_object(response)
      end

      def event_comics(id, query_params = {})
        if id.is_a?(String)
          event = find_event_by_name(id)
          return false unless event
          id = event.id
        end
        response = self.class.get(router.event_comics_path(:id => id), :query => params(query_params))
        build_response_object(response)
      end

      def event_creators(id, query_params = {})
        if id.is_a?(String)
          event = find_event_by_name(id)
          return false unless event
          id = event.id
        end
        response = self.class.get(router.event_creators_path(:id => id), :query => params(query_params))
        build_response_object(response)
      end
      
      def event_series(id, query_params = {})
        if id.is_a?(String)
          event = find_event_by_name(id)
          return false unless event
          id = event.id
        end
        response = self.class.get(router.event_series_path(:id => id), :query => params(query_params))
        build_response_object(response)
      end

      def event_stories(id, query_params = {})
        if id.is_a?(String)
          event = find_event_by_name(id)
          return false unless event
          id = event.id
        end
        response = self.class.get(router.event_stories_path(:id => id), :query => params(query_params))
        build_response_object(response)
      end

      protected
      def find_event_by_name(name)
        response = self.events(:name => name)
        return false unless response[:data][:results].size > 0

        response.id = response[:data][:results][0][:id]
        response
      end
    end
  end
end