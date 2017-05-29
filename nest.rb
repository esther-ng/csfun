collection = [-10, 2, 3, -2, 0, 5, -15]

length = collection.length

storage = {}

start = 0
(0...length).each do |i|
  (start...length).each do |j|
    storage[collection[i..j]] = collection[i..j].reduce(:+)
  end
  start += 1
end

sort = storage.sort_by do |k, v|
  v
end

puts "SORT LAST TO S"
puts sort.last.to_s

puts "SORT"
puts sort.to_s
puts "MAX"
puts storage.max.to_s
