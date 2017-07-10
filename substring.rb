def substrings string, substrings
  substrings = substrings.map! {|sub| sub.downcase}
  string.downcase!

  substring_appearances = Hash.new

  substrings.each do |substring|
    count = 0
    string.scan(substring) {count += 1}
    substring_appearances[substring] = count
  end

  return substring_appearances
end


example_string = "THis is a Fun string full of woo."
example_substrings = ["This", "fun", "o"]
puts substrings example_string, example_substrings
