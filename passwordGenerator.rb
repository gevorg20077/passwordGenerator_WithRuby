def generate_password(length = 8)
  vowels = %w[a e i o u]
  consonants = %w[b c d f g h j k l m n p q r s t v w x y z]
  password = ""

  (0...length).each do |i|
    if i.even?
      password += consonants.sample
    else
      password += vowels.sample
    end
  end

  password
end

puts generate_password(8)