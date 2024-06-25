def generate_password(length = 8, add_digits: false, add_special: false, digit_position: :end)
  vowels = %w[a e i o u]
  consonants = %w[b c d f g h j k l m n p q r s t v w x y z]
  combinations = %w[sh ch th ph wh oo ee]
  
  password = ""
  use_combinations = combinations.length > 0
  
  (0...length).each do |i|
    if use_combinations && i + 1 < length && rand < 0.2
      password += combinations.sample
      i += 1
    elsif i.even?
      password += consonants.sample
    else
      password += vowels.sample
    end
  end
  
  digits = (0..9).to_a.sample(2).join if add_digits
  special_chars = %w[! @ # $ % ^ & *].sample(1).join if add_special

  password = case digit_position
             when :start
               "#{digits}#{password}" if add_digits
             else
               "#{password}#{digits}" if add_digits
             end

  password += special_chars if add_special

  password
end

puts generate_password(8, add_digits: true, add_special: true, digit_position: :end)