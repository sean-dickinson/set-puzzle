require "test_helper"

class PuzzleCompletionTest < ActiveSupport::TestCase
  def setup
    @cards = [ { "color" => "red", "shape" => "oval", "number" => 1, "shade" => "striped" },
              { "color" => "purple", "shape" => "oval", "number" => 1, "shade" => "open" },
              { "color" => "green", "shape" => "diamond", "number" => 2, "shade" => "solid" },
              { "color" => "red", "shape" => "diamond", "number" => 3, "shade" => "open" },
              { "color" => "red", "shape" => "squiggle", "number" => 3, "shade" => "solid" },
              { "color" => "green", "shape" => "oval", "number" => 2, "shade" => "open" },
              { "color" => "red", "shape" => "squiggle", "number" => 2, "shade" => "open" },
              { "color" => "red", "shape" => "diamond", "number" => 2, "shade" => "solid" },
              { "color" => "red", "shape" => "oval", "number" => 2, "shade" => "solid" },
              { "color" => "purple", "shape" => "diamond", "number" => 2, "shade" => "solid" },
              { "color" => "red", "shape" => "oval", "number" => 3, "shade" => "open" },
              { "color" => "red", "shape" => "squiggle", "number" => 1, "shade" => "striped" } ]
  end

  test "it is not valid if the sets are empty" do
    completion = PuzzleCompletion.new(sets: [])
    refute completion.valid?
    assert completion.errors.include? :sets
  end

  test "it is not valid if any set does not contain exactly three cards" do
    completion = PuzzleCompletion.new(sets: [ [ @cards[0], @cards[1] ],
                                              [ @cards[2], @cards[3], @cards[4] ],
                                              [ @cards[5], @cards[6], @cards[7], @cards[8] ] ])
    refute completion.valid?
    assert completion.errors.include? :sets
  end

  it "is not valid if any set is not a valid set" do
    completion = PuzzleCompletion.new(sets: [ [ @cards[0], @cards[1], @cards[2] ],
                                              [ @cards[3], @cards[4], @cards[5] ],
                                              [ @cards[6], @cards[7], @cards[8] ] ])
    refute completion.valid?
    assert completion.errors.include? :sets
  end
  # test "the truth" do
  #   assert true
  # end
end
