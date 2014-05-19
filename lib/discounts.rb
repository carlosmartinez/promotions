class PercentageDiscount
  attr_reader :order 

  def initialize(opts)
    @percentage = opts[:percentage]
    @limit = opts[:limit]
    @order = 2
  end
  
  def discount_for(checkout, running_total)
    return 0 unless checkout.subtotal > @limit
    running_total * (@percentage/100.0)
  end
end

class BulkDiscount
  attr_reader :order 

  def initialize(opts)
    @pid = opts[:pid]
    @minimum = opts[:minimum]
    @item_discount = opts[:item_discount]
    @order = 1
  end

  def discount_for(checkout, running_total)
    relevant_items = checkout.items.select {|item| item.code == @pid}
    return 0 if relevant_items.length < @minimum
    relevant_items.length * @item_discount
  end
end