require 'rspec'
require 'assessment01b'

describe '#fibs_iter' do
  # write a method that iteratively returns a fibonnaci sequence

  it "returns the first fibonnacci number" do
    fibs_iter(1).should == [0]
  end

  it "returns the first two fibonacci numbers" do
    fibs_iter(2).should == [0, 1]
  end

  it "returns any number of fibonacci numbers" do
    fibs_iter(5).should == [0, 1, 1, 2, 3]
  end

  it "returns any number of fibonacci numbers II" do
    fibs_iter(10).should == [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
  end

  it "does not call itself recursively" do
    should_receive(:fibs_iter).exactly(1).times
    fibs_iter(5)
  end

end

describe '#sum_rec' do
  # write a method called 'sum_rec' that
  # recursively calculates the sum of an array of values

  it "returns 0 if no values are given" do
    sum_rec([]).should == 0
  end

  it "returns the first value if 1 value is given" do
    sum_rec([1]).should == 1
  end

  it "calls itself recursively" do
    should_receive(:sum_rec).at_least(:twice).and_call_original
    sum_rec([1, 2, 3, 4])
  end

  it "sums multiple numbers" do
    sum_rec([1, 2, 3, 4]).should == 10
  end

  it "sums multiple numbers II" do
    sum_rec([-10, 10, 5, 4]).should == 9
  end
end

describe '#binary_search' do
  # add a method to the Array class that performs a binary search for
  # an element and returns its index

  it "returns nil of the array is empty" do
    [].binary_search(1).should be_nil
  end

  it "returns the index of a target" do
    [1, 2, 3, 4, 5].binary_search(3).should == 2
  end

  it "returns the index of a target that's less than the midpoint" do
    [1, 2, 3, 4, 5].binary_search(2).should == 1
  end

  it "returns the index of a targat that's greater than the midpoint" do
    [1, 2, 3, 4, 5].binary_search(5).should == 4
  end

  it "returns nil if the target isn't found" do
    [1, 2, 3, 4, 5].binary_search(6).should be_nil
  end
end

describe '#uniq_subs' do
  # write a method that finds all the unique substrings for a word

  it "returns an array" do
    "substring".uniq_subs.should be_a_kind_of(Array)
  end

  it "does not return any duplicate substrings" do
    "stringstring".uniq_subs.uniq.should == "stringstring".uniq_subs
  end

  it "returns all unique substrings" do
    "str".uniq_subs.should =~ ["s", "st", "str", "t", "tr", "r"]
  end

  it "returns all unique substrings II" do
    "abab".uniq_subs.should =~ [
      "a",
      "ab",
      "aba",
      "abab",
      "b",
      "ba",
      "bab"
    ]
  end
end

describe '#merge_sort' do
  # add a merge_sort method to the Array class

  it "works on an empty array" do
    [].merge_sort.should == []
  end

  it "returns itself if there is 1 element" do
    [1].merge_sort.should == [1]
  end

  it "should return a sorted array" do
    [1, 4, 3, 5, 6].merge_sort.should == [1, 3, 4, 5, 6]
  end

  it "should return a sorted array II" do
    [4, 3, 2, 1, 0].merge_sort.should == [0, 1, 2, 3, 4]
  end

  it "should use a helper method 'merge' to merge arrays" do
    test = [1, 4, 3, 5, 6]
    test.should_receive(:merge).at_least(:once)
    test.merge_sort
  end
end
