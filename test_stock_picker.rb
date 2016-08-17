# less code
time = Time.now
def stock_picker(prices)

    day = 0
    maximum = 0
    range = []

    while(day < prices.length)
        buy_price = prices[day]

        (day+1...prices.length).each do |sell_day|

            sell_price = prices[sell_day]
            profit = sell_price - buy_price

            if profit > maximum
                maximum = profit
                range = [day, sell_day]
            end
        end

        day+=1
    end

    puts range
end

stock_picker([17,3,6,9,15,8,6,1,10])
puts Time.now - time 