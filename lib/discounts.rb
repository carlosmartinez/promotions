class PercentageDiscount
	def initialize(opts)
		@percentage = opts[:percentage]
		@limit = opts[:limit]
	end
	
	def discount_for(checkout)
		return 0 unless checkout.subtotal > @limit
		checkout.subtotal * (@percentage/100.0)
	end
end

class BulkDiscount
	def initialize(opts)
		@pid = opts[:pid]
		@minimum = opts[:minimum]
		@item_discount = opts[:item_discount]
	end

	def discount_for(checkout)
		relevant_items = checkout.items.select {|item| item.code == @pid}
		return 0 if relevant_items.length < @minimum
		relevant_items.length * @item_discount
	end
end