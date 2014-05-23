module Marvelite
  module API
    class Response < Hash
      include Hashie::Extensions::MergeInitializer
      include Hashie::Extensions::KeyConversion
      include Hashie::Extensions::MethodAccess
      include Hashie::Extensions::IndifferentAccess

      def initialize(raw)
        @raw = raw
        super(raw)
      end

      def raw_response
        @raw.response
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
