def substrings string, substrings
  substrings = substrings.map! {|sub| sub.downcase}
  string.downcase!

  substring_appearances = Hash.new

  substrings.each do |substring|
    substring_appearances[substring] = ocurrences string, substring
  end
  
  return substring_appearances
end

def ocurrences string, substring
  working_string = string.dup
  count = 0

  while working_string.include? substring
    count += 1
    working_string.sub!(substring, '')
  end

  return count
end
