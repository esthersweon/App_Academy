def caesar(string, shift)
	
  output = []
  string.chars.each do |char|
    output << mapper(char, shift)
  end
  output.join
end

def mapper(letter, shift)
  return ((letter.ord + shift) % 122).chr
end

puts caesar('hello', 3)