require 'rspec'
require 'hanoi.rb'

describe Hanoi do
  subject(:game) { Hanoi.new }

  # it "#render test to see if piles are printed out properly" do
  #   expect(game.render).to eq( "3\n2\n1")
  # end

  it "#move test to see if error is raised" do
    game.towers = [[3], [2], [1]]
    expect{game.move(0,1)}.to raise_error("invalid move")
    expect{game.move(0,5)}.to raise_error("non existent pile")
    expect{game.move(5,0)}.to raise_error("non existent pile")
    game.towers = [[3, 2, 1], [], []]
    expect{game.move(2,1)}.to raise_error("empty pile")
  end

  it "#move test to see if piece is moved appropriately" do
    game.towers = [[3, 2, 1], [], []]
    expect(game.move(0,1)).to eq([[3, 2], [1], []])
  end

  it "#won? test to see if game is won" do
    game.towers = [[], [], [3, 2, 1]]
    expect(game.won?).to eq(true)
  end

end