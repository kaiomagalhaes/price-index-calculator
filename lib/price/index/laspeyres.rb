module Price
  module Index
    module Laspeyres

      def calc products
        return [] if products.nil? || products.empty?
      end

      private

      def raise_illegal_argument_exception(field)
        raise ArgumenError

      end


    end
  end
end
