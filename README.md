Code test: promotions engine
=========

A relatively involved code test I completed in 2013 for an e-commerce company. 

## How to run

    bundle 
    rake spec
    rake cucumber

## Instructions for the test

Here is a sample of some of the products available on our site: 
 
<table>
  <thead>
    <tr>
      <th>Product code</th>
      <th>Name</th>
      <th>Price</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>001</td>
      <td>Travel Card Holder</td>
      <td>£9.25</td>
    </tr>
    <tr>
      <td>002</td>
      <td>Personalised cufflinks</td>
      <td>£45.00</td>
    </tr>
    <tr>
      <td>003</td>
      <td>Kids T-shirt</td>
      <td>£19.95</td>
    </tr>
  </tbody>
</table>

Our marketing team want to offer promotions as an incentive 
for our customers to purchase these items. 
 
If you spend over £60, then you get 10% off your purchase 
If you buy 2 or more travel card holders then the price 
drops to £8.50. 
 
Our check-out can scan items in any order, and because our 
promotions will change, it needs to be flexible regarding 
our promotional rules. 
 
The interface to our checkout looks like this (shown in 
Ruby): 
 
    co = Checkout.new(promotional_rules) 
    co.scan(item) 
    co.scan(item) 
    price = co.total 
 
Implement a checkout system that fulfills these 
requirements. 
 
### Test data 

Basket: 001,002,003 
Total price expected: £66.78 
 
Basket: 001,003,001 
Total price expected: £36.95 
 
Basket: 001,002,001,003 
Total price expected: £73.76 
