def length_of_longest_substring(s)
    return 0 if s.nil? || s.empty?
    longest = 1
    current_word = ""
    (0...s.length).each do |i|
      if s[i] == s[i-1]
        current_word = s[i]
      elsif current_word.include? s[i]
        current_word = current_word.split(s[i])[-1] + s[i]
      else
        current_word += s[i]
      end
      longest = [longest, current_word.length].max
    end
    return longest
end

puts length_of_longest_substring("aab")
puts length_of_longest_substring("bbbbb")
puts length_of_longest_substring("")
puts length_of_longest_substring("dvdf")
puts length_of_longest_substring("abcabcbb")
puts length_of_longest_substring("abcabcdbb")
# puts length_of_longest_substring("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~ abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~  abcdefghijklmnopqrstuvwxyzABCD")


# def length_of_longest_substring(s)
#     current_longest = 0
#     longest = 0
#     previous_characters = {}
#     (0...s.length).each do |i|
#       if previous_characters[s[i]].nil?
#         previous_characters[s[i]] = 1
#         current_longest += 1
#       elsif s[i] == s[i - 1]
#         longest = [longest, current_longest].max
#         previous_characters = {s[i] => 1}
#         current_longest = 1
#       elsif s[i] != s[i - 1]
#         longest = [longest, current_longest].max
#         previous_characters = {s[i-1] => 1, s[i] => 1}
#         current_longest = 2
#       else
#         longest = [longest, current_longest].max
#         previous_characters = {}
#         current_longest = 0
#       end
#       puts "i is #{i}"
#       puts longest, current_longest, previous_characters
#     end
#     return [longest, current_longest].max
# end
