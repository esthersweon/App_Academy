require_relative 'card'

class Deck
  def self.all_cards
    all_cards = []

    Card.suits.each do |suit|
      Card.values.each do |value|
        all_cards << Card.new(suit, value)
      end
    end

    all_cards
  end

  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  # Takes `n` cards from the top of the deck.
  def take(n)
    raise "not enough cards" if count < n
    @cards.shift(n)
  end

  # Returns an array of cards to the bottom of the deck.
  def return(cards)
    @cards.concat(cards)
  end
end