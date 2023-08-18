#First Week Assignment submit before 21 August 2023
#Baratas calculator for customers(users) basically a POS system but for customers
#put @ to variables after using loop do

def default_variable
	@cart = []
	@money = 0
end

def customer_name
	puts "Welcome to Baratas! Please enter your name"
	input_name = gets.chomp.upcase
	puts "Hello #{input_name}"
end

def prices
	@product_price = {
		"fish" =>  5.55,
		"egg" => 1.00,
		"apple" => 7.50
	}
	print "Enter an item to verify price: "
	@item = gets.chomp
	puts "The price of this #{@item} is RM #{@product_price[@item]}"
end

def continue_browsing
	puts "Would you like to add more?"
    @continuing = gets.chomp.downcase
end

def shop_cart_pick
	@cart << @item
	puts "Your Shopping Cart #{@cart}"
end

def shop_cart_calc
	@money += @product_price[@item]
	puts "Total net amount: RM #{@money}"
end

 def payment(total_amount)
 	puts "Please enter cash"
 	customer_cash = gets.chomp.to_f
 	balance = customer_cash - total_amount
 	puts "Here is your balance amount after payment: RM #{balance.round(2)}"
 end

customer_name
default_variable
loop do
	prices
	shop_cart_pick
	shop_cart_calc
    continue_browsing
	break if @continuing != "y"	
end
payment(@money)