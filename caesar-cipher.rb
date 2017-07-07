def caesar_cipher text, number
  chars = text.split("")
  chars.map! do |a|
    if ('A'..'Z').include?(a)
      a.downcase!
      a = shift(a, number)
      a.upcase!
    elsif ('a'..'z').include?(a)
      a = shift(a, number)
    else
      a
    end
  end
  text = chars.join
end

def shift character, number
  # Takes in a lowercase character and shifts it n spots.
  character = character.ord
  character = character + number
  character = 97 + character%123 if character > 122
  character = character.chr
end
