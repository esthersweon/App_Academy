require "./card.rb"

class Deck
  attr_reader :deck

  def initialize
    @deck = []
    ["hearts", "diamonds", "clubs", "spades"].each do |suit|
      [2..14].each { |face| @deck << Card.new(suit, face) }
    end
  end

  def [](element)
    @deck[element]
  end

end