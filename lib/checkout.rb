class Checkout
	attr_reader :items

	def initialize(*rules)
		@rules = rules
	end

	def scan(item)
		(@items ||= []) << item
	end

	def subtotal
		@items.inject(0){|sum, item| sum + item.price}
	end

	def total
	    discount = @rules.inject(0){|sum, rule| sum + rule.discount_for(self) }
	    (subtotal - discount).round(2)
    end
end