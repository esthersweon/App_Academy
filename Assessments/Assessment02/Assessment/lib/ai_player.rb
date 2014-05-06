# Represents a computer Crazy Eights player.
class AIPlayer
  # Creates a new player and deals them a hand of eight cards.

  attr_reader :cards

  def self.deal_player_in(deck)
    AIPlayer.new(deck.take(8))
  end

  def initialize(cards)
    @cards = cards
  end

  # Returns the suit the player has the most of; this is the suit to
  # switch to if player gains control via eight.
  def favorite_suit
    favorite_suit, max_count = nil, 0

    Card.suits.each do |suit|
      suit_count = @cards.count { |card| card.suit == suit}
      favorite_suit, max_count = suit, suit_count if suit_count > max_count
    end

    favorite_suit
  end

  # Plays a card from hand to the pile, removing it from the hand. Use
  # the pile's `#play` and `#play_eight` methods.
  def play_card(pile, card)
    raise "cannot play card outside your hand" if !@cards.include?(card)
    pile.play(card) if card.value != :eight
    pile.play_eight(card, favorite_suit) if card.value == :eight
    @cards.delete(card)
  end

  # Draw a card from the deck into player's hand.
  def draw_from(deck)
    @cards.concat(deck.take(1))
  end

  # Choose any valid card from the player's hand to play; prefer
  # non-eights to eights (save those!). Return nil if no possible
  # play. Use `Pile#valid_play?` here; do not repeat the Crazy Eight
  # rules written in the `Pile`.
  def choose_card(pile)
    @cards.each do |card|
      return card if pile.valid_play?(card) && card.value != :eight
    end

    @cards.select {|card| card.value == :eight}.first

  end

  # Try to choose a card; if AI has a valid play, play the card. Else,
  # draw from the deck and try again. If deck is empty, pass.
  def play_turn(pile, deck)
    loop do
      chosen_card = choose_card(pile)

      if !chosen_card.nil?
        play_card(pile, chosen_card)
        break
      elsif deck.count > 0
        draw_from(deck)
      else
        break
      end
    end
  end
end
