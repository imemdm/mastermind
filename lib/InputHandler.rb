class InputHandler
  def self.make_code
    puts "Make a code\n"
    [0, 0, 0, 0].map { |n| get_digit }
  end

  def self.guess_code
    puts "Guess the code\n"
    [0, 0, 0, 0].map { |n| get_digit }
  end

  def self.get_digit
    digit = -1
    until valid_digit?(digit)
      print "Enter a digit (0-5): "
      digit = gets.chomp.to_i 
    end
    digit
  end

  def self.valid_digit?(digit)
    digit.between?(0, 5)
  end
end