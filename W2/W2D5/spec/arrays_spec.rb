require 'rspec'
require 'arrays.rb'

describe Array do
  it "#my_uniq removes duplicates" do
    expect([1, 1].my_uniq).to eq([1])
    expect([1, 1, 2].my_uniq).to eq([1, 2])
    expect([1, 1, 1].my_uniq).to eq([1])
  end

  it "#my_uniq removes duplicate elements in an array" do
      [1, 2, 3, 1, 1, 2].my_uniq.sort.should eq([1, 2, 3])
    end

  it "#my_uniq only uses elements in array" do
     [1, 2, 3, 2, 1, 1].my_uniq.each do |el|
       expect([1, 2, 3, 2, 1, 1]).to include(el)
     end
  end

  it "#two_sum returns indexs of two element that add to zero" do
    expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
  end

  #my_transpose(arr)
  it "#my_transpose rotates array 90 deg" do
    expect(my_transpose([
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ])).to eq([[0, 3, 6],
     [1, 4, 7],
     [2, 5, 8]])
  end
  #stock_picker(arr)
  it "#stock_picker return best index to buy and sell" do
    expect(stock_picker([1,50,2,75,3,25])).to eq([0,3])
  end
end
#----------