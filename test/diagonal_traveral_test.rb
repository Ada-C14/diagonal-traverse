require 'minitest/autorun'
require 'minitest/reporters'
require "minitest/skip_dsl"

require_relative '../lib/diagonal_traversal.rb'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe "Diagonal Traversal" do
  it "will return ['a'] for [['a']]" do
    # Assert
    answer = diagonal_traversal([["a"]])

    # Assert
    expect(answer).must_equal ["a"]
  end

  it "will return [] for [[]]" do
    # Assert
    answer = diagonal_traversal([[]])

    # Assert
    expect(answer).must_equal []
  end

  it "will return [1, 2, 4, 7, 5, 3, 6, 8, 9] for the sample input" do
    # Arrange
    input = [
      [ 1, 2, 3 ],
      [ 4, 5, 6 ],
      [ 7, 8, 9 ]
      ]
    
    # Act
    answer = diagonal_traversal(input)

    # Assert
    expect(answer).must_equal [1, 2, 4, 7, 5, 3, 6, 8, 9]
  end

  it "will return ['a', 'b', 'e', 'i', 'f', 'c', 'd', 'g', 'j', 'k', 'h', l'] for the README input" do
    # Arrange 
    input = [
      ["a", "b", "c", "d"],
      ["e", "f", "g", "h"],
      ["i", "j", "k", "l"],
    ]

    # Act
    answer = diagonal_traversal(input)

    # Assert
    expect(answer).must_equal ["a", "b", "e", "i", "f", "c", "d", "g", "j", "k", "h", "l"]
  end
end