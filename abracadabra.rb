require 'set'
require 'colorize'
class Abracadabra
  attr_accessor :grid

  def initialize
    @grid = make_grid
  end

  def make_grid                      #row  #index of letters
    grid = []
    grid.push("     a")               #0  #5
    grid.push("    b b")              #1  #4 6
    grid.push("   r r r")             #2  #3 5 7
    grid.push("  a a a a")            #3  #2 4 6 8
    grid.push(" c c c c c")           #4  #1 3 5 7 9
    grid.push("a a a a a a")          #5  #0 2 4 6 8 10
    grid.push(" d d d d d  ")         #6  #1 3 5 7 9
    grid.push("  a a a a    ")        #7  #2 4 6 8
    grid.push("   b b b      ")       #8  #3 5 7
    grid.push("    r r        ")      #9  #4 6
    grid.push("     a          ")     #10 #5
    grid
  end

  def print_grid
    puts grid
  end

  def start
    valid = false
    while !valid do
      puts "Enter a series of five L's and five R's in any order"
      sequence = gets.chomp
      valid = validate(sequence)
    end
    trace($_.downcase)
  end

  def trace(sequence)
    col = 5
    0.upto(sequence.length) do |row|
      grid[row][col] = '*'.red
      sequence[row] == 'l' ? col-=1 : col+=1
    end
    print_grid
  end

  def validate(sequence)
    valid_characters(sequence) && valid_length(sequence)
  end

  def valid_characters(sequence)           #invalid if any char is not l L r R
    /[^lLrR]/.match?(sequence) ? false : true
  end

  def valid_length(sequence)
    sequence.length == 10 && sequence.count('lL') <= 5 && sequence.count('rR') <=5
  end


  #Credit for this string permutation Algorithm
  #https://gist.github.com/cyberfox/1574251

  def permutations(sequence)
    return sequence if sequence.empty?
    ch = sequence.delete_at(0)
    underlying = Set.new([ch])
    sequence.each do |ch|
      new_set = Set.new
      underlying.each do |permutation|
        (0..permutation.length).each do |idx|
          new_set.add(permutation.dup.insert(idx, ch))
        end
      end
      underlying = new_set
    end
    underlying.each
  end
  # Thanks again to cyberfox for the incredible algorithm!

  def show_all_solutions
    solutions = permutations(%w{l l l l l r r r r r}).to_a
    0.upto(solutions.length-1) do |solution|
        puts "Solution \# #{solution+1}"
        trace(solutions[solution])
        self.grid = make_grid
    end
    solutions.size
  end

end


abra = Abracadabra.new
puts "#{abra.show_all_solutions} possible solutions"
