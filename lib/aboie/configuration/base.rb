module Aboie
  module Configuration
    module Base
      def reset
          @@configuration = OpenStruct.new
      end
      def configure(&block)
        yield configuration
      end

      def configuration
        @@configuration
      end

      def self.extended(base)
        base.reset
      end
    end
  end
end
