#First Week Assignment submit before 21 August 2023
#Baratas calculator for customers(users) basically a POS system but for customers
#put @ to variables after using loop do

def default_variable #this method must be outside the loop
	@cart = []
	@net_amount = 0
	@voucher = { "v10" => 0.9, "v50"=> 0.5, "No"=> 1}
	@product_price = {
		"fish" =>  5.55,
		"egg" => 1.00,
		"apple" => 7.50
	}
	#@products = [@product_price].to_s
end

def customer_name
	puts "Welcome to Baratas! Please enter your name"
	input_name = gets.chomp.upcase
	puts "Hello #{input_name}"
end

def show_items
	puts "Items available: "
	@product_price.each {|key, value| puts "#{key}"} #show all item lists(key)
end

def prices
	puts "Enter an item to verify price: "
	while @item = gets.chomp
		case @item
		when @item == "0", "egg", "fish", "apple" #not future proof as more data added later,"0" as placeholder cus got bug, cant read the 1st key
			puts "The price of this #{@item} is RM #{@product_price[@item]}"
		    break
		else
			puts "Invalid item, please enter the correct item name."
		end	
	end
end


# def prices ----not working! I want try use Hash keys as parameters
# 	puts "Enter an item to verify price: "
# 	loop do
#     @item = gets.chomp
#  	break if @item == @product_price.each #how to use keys as parameters?
#   	puts "Invalid item, please enter the correct item name."
#  	end
#  	puts "The price of this #{@item} is RM #{@product_price[@item]}"
# end


# def prices ---simple method without re-prompt
#   print "Enter an item to verify price: "
#  	@item = gets.chomp
#   puts "The price of this #{@item} is RM #{@product_price[@item]}"
# end

def continue_browsing
	puts "Would you like to add more?"
    @continuing = gets.chomp.downcase
end

def shop_cart_pick
	@cart << @item
	puts "Your Shopping Cart #{@cart}"
end

def shop_cart_calc
	@net_amount += @product_price[@item]     
	puts "Total net amount: RM #{@net_amount}"
end

def voucher_discount
	puts "Please enter voucher code if available. Enter No if no voucher."
	while @voucher_code = gets.chomp
		case @voucher_code
		when @voucher_code == "0", "v10", "v50", "No" #not future proof as more data added later,"0" as placeholder cus got bug, cant read the 1st key
			@after_discount = @net_amount * @voucher[@voucher_code]
		    puts "Total gross amount: RM #{@after_discount.round(2)}"
		    break
		else
			puts "Invalid code, please enter the correct voucher."
		end	
	end
end

def payment(total_amount)
	loop do
 	puts "Please enter cash"
 	@customer_cash = gets.chomp.to_f
 	break if @customer_cash >= total_amount
    puts "Cash amount is invalid, please enter the correct amount."
    end
    balance = @customer_cash - total_amount
    puts "Here is your balance amount after payment: RM #{balance.round(2)}"
    puts "Voucher applied: #{@voucher_code}, #{@voucher[@voucher_code]}"
    puts "Thank you for shopping at our store and come again!"
end

#Start of program running

loop do
	customer_name
	default_variable
	show_items
	loop do
		prices
		shop_cart_pick
		shop_cart_calc
	    continue_browsing
		break if @continuing != "y"	
	end
	voucher_discount
	payment(@after_discount)
end