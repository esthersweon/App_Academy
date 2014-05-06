class Game
  attr_accessor :pot, :deck
  def initialize
    @deck = Deck.new
    @current_turn = 0
    @pot = 0
  end

  def turn

  end

  def add_bet(bet)
    @pot += bet
  end

end