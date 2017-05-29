# time: linear, space: constant
def print(arr)
  i = 0
  until arr[i] == INT_MAX
    print arr[i]
    i++
  end
end

# time: linear, space: constant
def max(arr)
  max = arr[0]
  i = 1
  until arr[i] == INT_MAX
    if arr[i] > max
      max = arr[i]
    end
    i++
  end
  return max
end

# time: quadratic
def delete(value, arr)
  (0..19).times do |i|
    if arr[i] == value
      (i..19).times do |j|
        arr[j] = arr[j+1]
      end
    end
  end
  if arr[20] == value
    arr[20] = INT_MAX
  end
end

def insert(value, arr, size)
  (0..size).times do |i|
    if value > arr[i] && value < arr[i+1]
      insert = i+1
      until size == insert do
        arr[size] = arr[size-1]
        size--
      end
    end
  end
end

def empty(arr)
  #set all values to INT_MAX
end
