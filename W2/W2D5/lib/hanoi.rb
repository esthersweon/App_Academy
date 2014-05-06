class Hanoi
  attr_accessor :towers

  def initialize
    @towers = [[3,2,1],[],[]]
  end

  # def render
  #   "#{@towers[0]}\n#{@towers[1]}\n#{@towers[2]}"
  # end

  def move(from, to)

    if @towers[from].nil? || @towers[to].nil?
      raise "non existent pile"
    elsif @towers[from].empty?
      raise "empty pile"
    elsif @towers[to].empty? == false && @towers[from].last > @towers[to].last
      raise "invalid move"
    elsif @towers[to].empty? || @towers[from].last < @towers[to].last
      @towers[to] << @towers[from].pop
    end
    @towers

  end

  def won?
    @towers[2] == [3,2,1]
  end

end