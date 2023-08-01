#Project: Stock Picker

def stock_picker(stock_array)

result = Hash.new
benefit = Array.new
  reverse_array = stock_array.reverse
  reverse_array.each_index do |r_index|
    stock_array.each_index do |index|
      profit = reverse_array[r_index] - stock_array[index]
      if profit != 0
        if profit > 0
          result[profit] = [index, r_index]
          benefit.push(profit)
          index += 1
        end
      else
        r_index += 1
        break
      end
    end
  end
  maximum = benefit.max
  result[maximum]
end 
  

p stock_picker([17,3,6,9,15,8,6,1,10]) 
#=> [1,4] 
