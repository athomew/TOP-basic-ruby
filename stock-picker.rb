test_values = [1, 1, 1, 1, 1, 1]


def stock_picker values

  if values.length < 2
    puts "Not enough days!"
    return nil
  end

  selling_day = 0
  buying_day = 0
  max_profit = 0


  values.each_index do |i|
    values.each_index do |j|
      if i <= j
        current_profit = values[j] - values[i]
        if current_profit > max_profit
          selling_day = j
          buying_day = i
          max_profit = current_profit
        end
      end
    end
  end

  results = [buying_day + 1, selling_day + 1]
  puts results
end

stock_picker test_values
