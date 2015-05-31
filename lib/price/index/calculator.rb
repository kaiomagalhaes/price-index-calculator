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
       
        index = (new_product[:amount] * new_product[:price]) / (old_product[:amount] * old_product[:price])
        new_product[:price_index] = index * 100
        new_product
      end

      def price_index_list(products)
       return [] if products.nil? || products.empty?
      end

    end
  end
end
