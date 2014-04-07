def caesar_cipher(str, shift)
    alphabet = ('a'..'z').to_a.join('')
    cipher = ('a'..'z').to_a.rotate(shift).join('')
    
    word_length = str.length
    first_letter = str.split('').first
    starting_index = alphabet.index(first_letter)
    
    answer = cipher[starting_index...starting_index + word_length].to_s
end