module Marvelite
  module API
    class Router
      require 'yaml'
      attr_accessor :api_version

      def initialize(attrs = {})
        @api_version = attrs.fetch(:api_version) { 'v1' }
        @routes = {}
        load_routes_from_file("#{api_version}.yml")
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
        routes["#{name}_path".to_sym] = { :name => name, :endpoint => endpoint }
      end

      def method_missing(method, *args, &block)
        if routes.keys.include?(method)
          endpoint = "#{routes[method][:endpoint]}"
          params = *args
          if params.any?
            params[0].each do |p_key, p_value|
              endpoint.gsub!(":#{p_key.to_s}", p_value.to_s)
            end
          end
          "/#{api_version}#{endpoint}"
        else
          super
        end
      end

    end
  end
end