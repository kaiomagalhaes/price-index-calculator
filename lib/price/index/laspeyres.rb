module Price
  module Index
    module Laspeyres

      def calc data
        return [] if data.nil? || data.empty?
        validate data

      end

      private

      def validate data
        raise_illegal_argument_exception("period") if data[:period] == nil
        puts data
      end

      def raise_illegal_argument_exception(field)
        raise ArgumentError.new("The field #{field} is empty")
      end

    end
  end
end
