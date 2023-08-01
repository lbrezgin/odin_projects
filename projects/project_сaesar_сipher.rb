# Caesar Cipher

def caesar_cipher(string, position)
  alphabet = ("a".."z").to_a
  alphabet_big = ("A".."Z").to_a

  result = ""
  
  string.each_char do |letter|
    if alphabet.include?(letter) || alphabet_big.include?(letter)
      if letter == " "
        result += " "
      elsif letter == letter.upcase
        old_index = alphabet_big.find_index(letter)
        new_index = (old_index + position) % alphabet_big.count
        result += alphabet_big[new_index]
      elsif letter == letter.downcase
        old_index = alphabet.find_index(letter)
        new_index = (old_index + position) % alphabet.count
        result += alphabet[new_index]
      end
    else
      result += letter
    end
  end
  result
end

puts caesar_cipher("what a String!", 5)
#=> "Bmfy f xywnsl!"
