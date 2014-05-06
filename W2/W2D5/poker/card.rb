#encoding: utf-8

class Card
  attr_reader :suit, :face

  SUITS = {:hearts => "♥", :diamonds => "◆", :clubs => "♣", :spades => "♠"}
  FACES = {2 => "2",3 => "3",4 => "4",5 => "5",6=> "6",7 => "7",8 => "8",9 => "9",
    10 => "10", 11 => "J", 12 => "Q", 13 => "K", 14 => "A"}

  def initialize(suit, face)
    @suit, @face = suit, face
  end

  def <=>(other_card)
    self.face <=> other_card.face
  end

  def to_s
    FACES[self.face] + SUITS[self.suit.to_sym]
  end

end