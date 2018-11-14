class AI
  @@feedbacks = [
    [0, 0], [1, 0], [2, 0], [3, 0], [4, 0], [0, 1], [0, 2], 
    [0, 3], [0, 4], [1, 1], [2, 1], [1, 2], [2, 2], [1, 3]
  ]

  attr_accessor :guess, :codes, :s
  attr_reader :maker

  def initialize
    @codes = (0..5).to_a.repeated_permutation(4).to_a
    @guess = [1, 1, 2, 2] 
    @maker = CodeMaker.new
    @s = @codes.dup
  end

  def attempt(data)
    g = nil
    if data.empty?
      g = self.guess
    else
      self.s = eliminate(self.s, data)
      g = minimax
    end
    self.codes -= [g]
    g
  end

  private
  def minimax
    next_guess = nil
    hit_counts = self.codes.map do |guess|
      max_hits = 0
      @@feedbacks.each do |fb|
        remaining = eliminate(self.s, {guess: guess, feedback: fb})
        if remaining.length > max_hits
          max_hits = remaining.length
        end
      end

      {guess: guess, hits: max_hits}
    end
    
    hit_counts.sort! do |a, b|
      a[:hits] <=> b[:hits]
    end

    minimums = hit_counts.select do |el|
      el[:hits] == hit_counts[0][:hits]
    end
    
    p "Minimums: #{minimums}"
    p "S: #{self.s}"

    minimums.each do |el|
      if self.s.include?(el[:guess])
        next_guess = el[:guess]
        break
      end
    end

    p "Next guess: #{next_guess}"
    
    next_guess = minimums[0][:guess] if next_guess.nil?


    next_guess
  end

  # Returns a collection containing all codes that gave
  # same response as the hidden pattern against a guess
  def eliminate(collection, data)
    collection.select do |solution|
      fb = self.maker.feedback(data[:guess], solution)
      fb[0] == data[:feedback][0] && fb[1] == data[:feedback][1]
    end
  end
end