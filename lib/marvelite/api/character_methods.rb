module Marvelite
  module API
    module CharacterMethods
      def characters(query_params = {})
        response = self.class.get(router.characters_path, :query => params(query_params))
        build_response_object(response)
      end

      def character(value)
        by_name = value.is_a?(String) ? true : false
        response = if by_name
          find_character_by_name(value)
        else
          self.class.get(router.character_path(:id => value), :query => params)
        end

        build_response_object(response)
      end

      def character_comics(id, query_params = {})
        if id.is_a?(String)
          character = find_character_by_name(id)
          return false unless character
          id = character.id
        end

        response = self.class.get(router.character_comics_path(:id => id), :query => params(query_params))
        build_response_object(response)
      end

      def character_events(id, query_params = {})
        if id.is_a?(String)
          character = find_character_by_name(id)
          return false unless character
          id = character.id
        end
        response = self.class.get(router.character_events_path(:id => id), :query => params(query_params))
        build_response_object(response)
      end

      def character_series(id, query_params = {})
        if id.is_a?(String)
          character = find_character_by_name(id)
          return false unless character
          id = character.id
        end
        response = self.class.get(router.character_series_path(:id => id), :query => params(query_params))
        build_response_object(response)
      end
      
      def character_stories(id, query_params = {})
        if id.is_a?(String)
          character = find_character_by_name(id)
          return false unless character
          id = character.id
        end
        response = self.class.get(router.character_stories_path(:id => id), :query => params(query_params))
        build_response_object(response)
      end
    end
  end
end