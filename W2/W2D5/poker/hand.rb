require "./deck.rb"

class Hand
  attr_reader :hand

  def initialize(deck)
    @hand = deck.take(5)
  end

  def discard(*card_idx)
    card_idx.each do |idx|
      @hand.delete_at(idx)
    end
  end

  def select
    @hand.concat(deck.take(5 - @hand.length))
  end

  def [](element)
    @hand[element] #CARD CLASS
  end

  def calculating_score
    if royal_flush?
      return 15
    elsif flush? && straight?
      return 14
    elsif map_faces.has_value?(4)
      return 13
    elsif map_faces.has_value?(3) && map_faces.has_value?(2)
      return 12
    elsif flush?
      return 11
    elsif straight?
      return 10
    elsif map_faces.has_value?(3)#includes 3 as a value
      return 9
    elsif map_faces.keys.count == 2 #includes 2 and 2 as values
      return 8
    elsif mmap_faces.has_value?(2) #includes 2 as a value
      return 7
    else
      return 1 # high card
    end
      # each hand needs a high_card
  end

  def royal_flush?
    return false if !flush?
    return false if !straight?

    new_arr = []
    @hand.each { |card| new_arr << card.face}
    new_arr.sort!

    new_arr.include?(13) && new_arr.include?(14)
  end

  def flush?
    suit_standard = @hand[0].suit
    @hand.each { |card| return false if card.suit != suit_standard }
    return true
  end

  def straight?
    new_arr = []
    @hand.each { |card| new_arr << card.face}
    new_arr.sort!
    bottom_ace_straight = ((new_arr[-2] - new_arr[0] == 3) && (new_arr[-1] == 14 && new_arr[0] == 2))
    (new_arr[-1] - new_arr[0] == 4) || bottom_ace_straight
  end

  def map_faces
    h = {}
    @hand.each do |card|
      h[card.face].nil? ? h[card.face] = 1 : h[card.face] += 1
    end

    h.each do |k, v|
      h.delete(k) if v < 2
    end

    h #returns pairs
  end

  def high_card
    map_faces.keys.sort.last
  end

end


