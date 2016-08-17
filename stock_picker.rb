#wayyyy more efficient with more data
time = Time.now

def stock_picker(daily_stock_prices)
	count = 1
	buy_options = {}
	buy_price = 0
	sell_price = 0 
	daily_stock_prices.each_with_index do |price, day|
		# This should only happen on first iteration, to initialize buy_sell_options w/ count = 1, buy_price, & sell_price
		if day == 0
			buy_options = { 
				"option"+count.to_s => { :buy_day => day, :buy_price => price, :sell_day => day, :sell_price => price } 
			} 
			buy_price = price
			sell_price = price		
		end

		# If price is lower then current buy_price, add a new buying option and set buy/sell prices
		if price < buy_price
			buy_price, sell_price = price, price
			count += 1
			buy_options["option" + count.to_s] = { :buy_day => day, :buy_price => price, :sell_day => day, :sell_price => price }
		# If price is higher then current sell_price, change sell_day/_price for current buying option
		elsif price > sell_price
			sell_price = price 
			buy_options["option" + count.to_s][:sell_day], buy_options["option" + count.to_s][:sell_price] = day,price				
		end
	end

	# Compare buying options to find biggest profit
	profit = 0
	best_option = ""
	buy_options.each do |option, values|
		if (values[:sell_price] - values[:buy_price]) > profit
			best_option = option
			profit = values[:sell_price] - values[:buy_price]
		end 
	end

	puts buy_options[best_option][:buy_day].to_s + "," + buy_options[best_option][:sell_day].to_s
	puts "Buy on day " + buy_options[best_option][:buy_day].to_s + " and sell on day " + buy_options[best_option][:sell_day].to_s + " for a profit of " + profit.to_s
end

stock_picker([17,3,6,9,15,8,6,1,10])

puts Time.now - time 