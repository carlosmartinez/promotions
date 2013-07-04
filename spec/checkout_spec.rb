require "rspec"
['item', 'checkout', 'discounts'].each{|s| require_relative("../lib/#{s}")}

describe "Checkout behaviour" do

  it "should calculate simple total" do 
    co = Checkout.new
    co.scan(Item.new('', 50.00))
    co.scan(Item.new('', 50.00))
    co.total.should == 100.00
  end

  it "should calculate percentage discount" do
    co = Checkout.new(PercentageDiscount.new({:limit => 60, :percentage => 10}))
    co.scan(Item.new('', 50.00))
    co.scan(Item.new('', 50.00))
    co.total.should == 90.00
  end

  it "should not apply percentage discount if subtotal lower than limit" do 
    co = Checkout.new(PercentageDiscount.new({:limit => 110, :percentage => 10}))
    co.scan(Item.new('', 50.00))
    co.scan(Item.new('', 50.00))
    co.total.should == 100.00
  end

  it "should calculate bulk discount" do 
  	co = Checkout.new(BulkDiscount.new({:pid => 'ABC', :minimum => 2, :item_discount => 1.20 }))
    co.scan(Item.new('ABC', 6.20))
    co.scan(Item.new('ABC', 6.20))
    co.total.should == 10.00
  end

  it "should apply multiple rules in order" do 
  	rule1 = PercentageDiscount.new({:limit => 20, :percentage => 10})
  	rule2 = BulkDiscount.new({:pid => 'ABC', :minimum => 2, :item_discount => 1.00 })
  	co = Checkout.new(rule1, rule2)
  	item = Item.new('ABC', 15.00)
  	co.scan item
  	co.scan item
  	co.total.should == 25.20
  	co.total.should_not == 25.00
  end

end
