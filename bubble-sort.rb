def bubble_sort array
  swaps = true
  while(swaps)
    swaps = false
    (array.length - 1).times do |i|
      array[i], array[i+1], swaps = array[i+1], array[i], true if array[i] > array[i+1]
    end
  end
  array
end

def bubble_sort_by array, &block
  swaps = true
  while(swaps)
    swaps = false
    (array.length - 1).times do |i|
      array[i], array[i+1], swaps = array[i+1], array[i], true if (block.call(array[i], array[i+1]) > 0)
    end
  end
  array
end
