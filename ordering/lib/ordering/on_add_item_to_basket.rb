module Ordering
  class OnAddItemToBasket
    include CommandHandler

    def call(command)
      Rails.logger.debug("CommandHandler: OnAddItemToBasket")
      with_aggregate(Order, command.aggregate_id) do |order|
        order.add_item(command.product_id)
      end
    end
  end
end
