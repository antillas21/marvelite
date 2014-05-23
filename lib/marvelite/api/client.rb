module Marvelite
  module API
    class Client
      include HTTParty
      base_uri 'http://gateway.marvel.com'

      attr_accessor :public_key, :private_key, :router, :api_version

      class InvalidClientError < StandardError; end

      def initialize(attrs)
        check_for_errors(attrs)
        @public_key = attrs.fetch(:public_key)
        @private_key = attrs.fetch(:private_key)
        @api_version = attrs.fetch(:api_version) { 'v1' }
        @router = attrs.fetch(:router) { Marvelite.router(:api_version => @api_version) }
        build_methods
      end

      private
      def check_for_errors(attrs)
        [:public_key, :private_key].each do |key|
          raise InvalidClientError, "You need to provide a :#{key} param." unless attrs[key]
        end
      end

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

      def build_response_object(response)
        Response.make(response)
      end

      def find_by_name_or_title(endpoint, column, value)
        response = self.send(endpoint, { column.to_sym => value })
        return false unless response[:data][:count] > 0
        response[:id] = response[:data][:results][0][:id]
        response
      end

      def pull_headers(options)
        headers = options.delete(:headers) || {}
        headers.merge!({ 'Accept-Encoding' => 'gzip' }) unless headers['Accept-Encoding']
        [options, headers]
      end

      def process_arguments(*args)
        temp_id, temp_options = *args
        if temp_id && temp_id.is_a?(Hash)
          id = nil
          options = temp_id || {}
        elsif temp_id
          id = temp_id
          options = temp_options || {}
        else
          options = {}
        end
        params, headers = pull_headers(options)
        [{ id: id, options: params}, headers]
      end

      def fetch_response(route, params_hash = {}, headers = {})
        id = params_hash[:id]
        options = params_hash[:options]
        path = find_path(route, id)

        self.class.get(path, query: params(options), headers: headers)
      end

      def find_path(route, id)
        if id.nil?
          router.send("#{route}_path".to_sym)
        else
          id = fetch_resource_id(route, id) if id.is_a?(String)
          router.send("#{route}_path".to_sym, {:id => id})
        end
      end

      def fetch_resource_id(route, id)
        endpoint = route.split("_")[0]+"s"
        resource = find_by_name_or_title(endpoint.to_sym, :name, id)
        return false unless resource
        resource[:id]
      end

      def build_methods
        @router.routes.each do |_, hash|
          name = hash[:name]
          self.class.send(:define_method, name) do |*args|
            params, headers = process_arguments(*args)
            response = fetch_response(name, params, headers)
            build_response_object(response)
          end
        end
      end

    end
  end
end
