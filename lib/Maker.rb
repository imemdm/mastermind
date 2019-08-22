class Maker
  def initialize(player)
    @player = player
    @code = generate_code
  end

  def give_feedback(on:)
    code
      .map.with_index { |el, idx| on[idx] == el ? "both" : el }
      .map.with_index { |el, idx| on.include?(el) ? "value" : el }
      reduce([0, 0]) do |fb, peg|
        fb[0] += 1 if peg == "both"
        fb[1] += 1 if peg == "value"
        fb
      end
  end
  
  private

  attr_reader :player

  def generate_code
    player.status == :human ? InputHandler.make_code : random_code
  end

  # Generates a code with 4 random elements
  def random_code
    [0, 0, 0, 0].map { |n| rand(6) }
  end

  # Human player creates a hidden pattern
  def handle_code_input
    puts "Create a pattern..."
    code = []
    4.times do |i|
      n = -1
      loop do
        print "Enter a number: "
        n = gets.chomp.to_i
        break if valid_entry?(n)
      end
      code << n
    end
    self.pattern = code
  end

  # Checks if the given number is a valid pattern value
  def valid_entry?(n)
    n >= 0 && n <= 5
  end
end