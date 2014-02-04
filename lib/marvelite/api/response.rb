module Marvelite
  module API
    class Response < Hash
      include Hashie::Extensions::MergeInitializer
      include Hashie::Extensions::KeyConversion
      include Hashie::Extensions::MethodAccess
      include Hashie::Extensions::IndifferentAccess
    end

    class ErrorResponse < Hash
      include Hashie::Extensions::MergeInitializer
      include Hashie::Extensions::KeyConversion
      include Hashie::Extensions::MethodAccess
      include Hashie::Extensions::IndifferentAccess
    end
  end
end