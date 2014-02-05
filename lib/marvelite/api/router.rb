module Marvelite
  module API
    class Router
      require 'yaml'
      attr_accessor :api_version

      def initialize(attrs = {})
        @api_version = attrs.fetch(:api_version) { 'v1' }
        @routes = []
        load_routes_from_file("#{api_version}_routes.yml")
        map_routes
      end

      def inspect
        "#<#{self.class}:#{self.object_id}>"
      end

      def load_routes_from_file(filename)
        file_path =  File.join(File.dirname(__FILE__), "config", filename)
        f = YAML.load(File.read(file_path))
        f.each do |_, route|
          add_route(route['name'], route['path'])
        end
      end

      def routes
        @routes
      end

      def add_route(name, endpoint)
        route = [name, endpoint]
        routes << route
      end

      def map_routes
        routes.each do |name, endpoint|
          self.class.send(:define_method, "#{name}_path") do |params = {}|
            params
            params.each do |p_key, p_value|
              endpoint.gsub!(":#{p_key.to_s}", p_value.to_s)
            end
            "/#{api_version}#{endpoint}"
          end
        end
      end
    end
  end
end