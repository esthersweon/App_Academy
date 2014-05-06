def concat(words)
  words.inject(""){|sentence, word| sentence + word}
end

puts concat(['yay ', 'for ', 'strings!'])