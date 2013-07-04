Feature: Discount engine
	Background:
    	Given I have data
			|	Product code 	| Name 						| Price		|
			|	001 			| Travel Card Holder 		| 9.25		|
			|	002 			| Personalised cufflinks 	| 45.00		|
			|	003 			| Kids T-shirt 				| 19.95		|
		
 	Scenario: test case 1
		When I have a checkout with products 
			| 001 | 002 | 003 |
		Then the total price is 66.78

 	Scenario: test case 2
		When I have a checkout with products 
			| 001 | 003 | 001 |
		Then the total price is 36.95

 	Scenario: test case 3
		When I have a checkout with products 
			| 001 | 002 | 001 | 003 |
		Then the total price is 73.76