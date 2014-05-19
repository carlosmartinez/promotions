class Checkout
  attr_reader :items

  def initialize(*rules)
    @rules = rules.sort_by{|r| r.order}
  end

  def scan(item)
    (@items ||= []) << item
  end

  def subtotal
    @items.inject(0){|sum, item| sum + item.price}
  end

  def total
    running_total = subtotal
    discount = @rules.inject(0) do |sum, rule| 
      item_discount = rule.discount_for(self, running_total)
      running_total = running_total - item_discount 
      sum + item_discount
    end
    (subtotal - discount).round(2)
  end
end