require "price/index/product"
module Price
  module Index
    module Laspeyres

      def calc data
        binding.pry
        return [] if data.nil? || data.empty?
        validate data, "periods"
        calculate_price_index data.clone
      end

      private

      def calculate_price_index data
        periods = data["period"]
        order! periods
        base_products = calculate_base_price_index periods

        periods.collect do |period|
          products = period["products"]
          products.collect do |product|
            base_product = base_products.find{ |base_product| base_product[:name] == product["name"]}
            binding.pry
            product["index"] ||= {}
            product_price = product["price"].to_f
            product["index"]["laspeyre"] = product_price / base_product[:price] * base_product[:base_price_index]
            puts product
            product
          end
        end
      end

      def calculate_base_price_index periods
        first_month_data = periods.first
        products_first_month = first_month_data["products"]
        total_price = first_month_data["total_price"].to_f
        products_first_month.collect do |product|
          name = product["name"]
          price = product["price"].to_f
          amount = product["amount"].to_i
          base_index = (price * amount * 100 ) / total_price
          {name: name, base_price_index: base_index, price: price}
        end
      end

      def order!(periods)
        periods.sort! do |x, y|
          formate_date(x["data"]) <=> formate_date(y["data"])
        end
      end

      def formate_date str_date
        Date.strptime(str_date,"%d/%m/%Y")
      end

      def validate data, field
        raise_illegal_argument_exception(field) if data[field] == nil
      end

      def raise_illegal_argument_exception(field)
        raise ArgumentError.new("The field #{field} is invalid or empty")
      end

    end
  end
end
