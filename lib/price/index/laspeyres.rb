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
        order! periods
        puts calculate_base_price_index periods
        periods.collect do |period|
          # puts period
        end
        data
      end

      def calculate_base_price_index periods
        first_month_data = periods.first
        products_first_month = first_month_data["products"]
        total_price = first_month_data["total_price"].to_f
        products_first_month.collect do |product|
          product_name = product["name"]
          product_price = product["price"].to_f
          base_index = (product_price * 100 ) / total_price
          {name: product_name, base_price_index: base_index}
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

      def validate data
        raise_illegal_argument_exception("period") if data["period"] == nil
      end

      def raise_illegal_argument_exception(field)
        raise ArgumentError.new("The field #{field} is invalid or empty")
      end

    end
  end
end
