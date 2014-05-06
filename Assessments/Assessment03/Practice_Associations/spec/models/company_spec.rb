require 'spec_helper'

describe Company do
  subject(:com) { Company.first }

  it "has a price" do
    price1 = Price.find(1)
    price2 = Price.find(2)
    price3 = Price.find(10)
    expect(com.prices).to include(price1, price2, price3)
    expect(com.prices.length).to eq(10)
  end

  it "has an exchange" do
    expect(com.exchange.name).to eq("NASDAQ")
  end

  it "has a watch list" do
    expect(Company.first.watch_lists.first.name).to eq("big winners")
  end

  it "has a watcher" do
    expect(Company.first.watchers.first.username).to eq("stevej")
  end

  it "has a board" do
    goog_id = Company.find_by_name("Google").id
    expect(com.board.id).to eq(goog_id)
  end
end
