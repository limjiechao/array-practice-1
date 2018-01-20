

class String
  def dashes
    # Check if items at index 0 and 1, 1 and 2, 2 and 3 etc… are both even
    # Stop checking when last item in array is reached
    return self unless self.match?(/^\d+$/)
    array = self.chars
    insert_at = Array.new
    self.chars.each_index do |index|
      unless self.chars[index] == self.chars.last
        if self.chars[index].to_i.even? && self.chars[index + 1].to_i.even?
          insert_at << index
        end
      end
    end
    insert_at.length.times do |index|
      array[insert_at[index]] << '-'
    end
    array.join
  end
end
# Normal Case
# - Must be string
# - All characters must be digits
# - Push dash accordingly
#   - 1357 => 1357
#   - 2468 => 2-4-6-8
#
# Edge
# - If not digits only, add no dashes


class Array
  # Array
  # Unique Array
  # Unique Array to Hash with each key initialized with value '0'
  # Return key with highest value
  def frequent
    return nil if self.empty?
    keys = self.uniq
    hash = Hash.new
    keys.each_index { |index| hash[keys[index]] = 0 }
    self.each { |item| hash[item] += 1 }
    "#{hash.key(hash.values.max)} (#{hash.values.max} times)" if hash.select {|item, frequency| frequency == hash.values.max}.one?
  end
  # Normal cases
  # - Has to be Array
  # - ['a', 'a', 'a', 'b' ] => 'a (3 times)'
  # - ['x', 'a', 'a', 'b'] => 'a (2 times)'
  #
  # Abnormal cases
  # - Cannot be empty
  #
  # Edge case
  # - Two most frequent items in array

  # #uniq
  # #downcase
  def remove_duplicate
    return nil if self.empty?
    return self if self.any? { |item| item.class != Integer && item.class != String }
    array = self.map do |item|
      if item.class == String && /^[A-Z]+$/.match(item)
        item.downcase
      else
        item
      end
    end
    array.uniq
  end
  # Normal cases
  # - Has to be array
  # - Check if array items are either number or string
  # - ['abc', 'abc', 'b', 'c']
  #
  # Abnormal Cases
  # - Cannot be empty
  # - Other than numbers and strings, all other data types not accepted

end

# '025486'.dashes => '0-254-8-6'
# [3, 'a', 'a', 'a', 2, 3, 'a', 3, 'a', 2, 4, 9, 3].frequent => 'a (5 times)'
# [1, 'a', 'A', 'b', 2, 2].remove_duplicate => [1, 'a', 'b', 2]

'025486'.dashes
# [3, 'a', 'a', 'a', 2, 3, 'a', 3, 'a', 2, 4, 9, 3].frequent
# p [1, 1, 2, 2].frequent

p [1, 'a', 'A', 'b', 2, 2].remove_duplicate
p ['abc', 'ABC', 'B', 'c'].remove_duplicate
p ['abc', 'abc', 'b', 'c'].remove_duplicate

def union(array_one, array_two)
  return nil if (array_one.class != Array || array_two.class != Array)
  array_one | array_two
end

def mergeArray(array_one, array_two)
  return nil if (array_one.class != Array || array_two.class != Array)
  hash = Hash.new(0)
  unique = (array_one | array_two).uniq
  combined = array_one + array_two
  combined.each do |item|
    unique.include?(item) ? hash[item] += 1 : hash[item] += 0
  end
  hash.each do |key, value|
    until hash[key] == 1
      combined.delete_at(combined.index(key))
      hash[key] -= 1
    end
  end
  p hash
  combined
end
