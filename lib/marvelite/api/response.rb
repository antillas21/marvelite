module Marvelite
  module API
    class Response < Hash
      include Hashie::Extensions::MergeInitializer
      include Hashie::Extensions::KeyConversion
      include Hashie::Extensions::MethodAccess
      include Hashie::Extensions::IndifferentAccess

      attr_reader :raw_response

      def self.make(response)
        case response.code
        when 200
          Response.new(response)
        when 304
          NotModifiedResponse.new(response)
        else
          ErrorResponse.new(response)
        end
      end

      def initialize(raw)
        @raw_response = raw
        super(raw)
      end
    end

    class ErrorResponse < Response; end

    class NotModifiedResponse < Response
      def initialize(response)
        super({
          status: 'Not Modified',
          code: 304,
          data: {},
          etag: response.headers['etag']
        })
      end
    end
  end
end
