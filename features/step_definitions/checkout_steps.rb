['item', 'checkout', 'discounts'].each{|s| require_relative("../../lib/#{s}")}

def map_data_to_items(data)
	data[1..-1].map{|row| Item.new(row[0], row[2].to_f)}
end

def map_ids_to_products(product_ids)
	product_ids.map{|pid| @items.select{|item| item.code == pid}.first }
end

def checkout_with_rules
  rule1 = PercentageDiscount.new({:limit => 60, :percentage => 10})
  rule2 = BulkDiscount.new({:pid => '001', :minimum => 2, :item_discount => 0.75})
  Checkout.new(rule1, rule2)
end

Given(/I have data/) do |table|
	data = table.raw
	@items = map_data_to_items data
end

When(/I have a checkout with products/) do |table|
	product_ids = table.raw[0]
  @checkout = checkout_with_rules
  products = map_ids_to_products product_ids
  products.each {|p| @checkout.scan p}
end

Then(/the total price is ([\d\.]+)/) do |total|
	@checkout.total.should == total.to_f
end