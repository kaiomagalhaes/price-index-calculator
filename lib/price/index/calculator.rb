require "price/index/calculator/version"

module Price
  module Index
    module Calculator

      def price_index(new_product, old_product)
        return Hash.new if new_product.nil?

        if old_product.nil?
          new_product[:price_index] = 100
          return new_product
        end

        validade_product new_product
        validade_product old_product

        new_product[:price_index] = calc_index_value(new_product, old_product) 
        new_product
      end

      def price_index_list(products)
       return [] if products.nil? || products.empty?
      end

      private

      def calc_index_value(new_product, old_product)
         (old_product[:amount] * new_product[:price]) / (old_product[:amount] * old_product[:price]) * 100
      end

      def validade_product(product)
        raise_illegal_argument_exception if product[:amount].nil?
        raise_illegal_argument_exception if product[:price].nil?
      end

      def raise_illegal_argument_exception(field)
        raise ArgumenError

      end

    end
  end
end
