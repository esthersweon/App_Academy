def stock_picker(prices)
  best_pair = []
  max = 0
  
  prices.each_index do |day1|
    prices.each_index do |day2|
      next if day2 < day1
      
      profit = prices[day2] - prices[day1]
      
      if profit > max
        best_pair, max = [day1, day2],profit
      end
    end
  end
  
  best_pair
end

puts stock_picker([13, 2, 56, 3, 5, 700, 1])