def merge_sort(array)

  sorted = []
  return array if array.length <= 1

  mid = array.length/2
  left = merge_sort(array[0...mid])
  right = merge_sort(array[mid..-1])

  until left.empty? || right.empty?
    if left.first <= right.first
      sorted << left.shift
    else
      sorted << right.shift
    end
  end
  sorted + right + left
end

p merge_sort([1,5,3,2,4,6,10])
