module Price
  module Index
    module Laspeyres

      def calc data
        return [] if data.nil? || data.empty?
        validate data
        calculate_price_index data.clone
      end

      private

      def calculate_price_index data
        periods = data["period"]
        data
      end

      def validate data
        raise_illegal_argument_exception("period") if data["period"] == nil
      end

      def raise_illegal_argument_exception(field)
        raise ArgumentError.new("The field #{field} is invalid or empty")
      end

    end
  end
end
