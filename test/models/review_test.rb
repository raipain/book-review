require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save a blank review" do
    review = Review.new
    assert_not review.save, "Saved a blank review"
  end

  test "should not save a review without title" do
    review = Review.new :content => "Lorem ipsum"
    assert_not review.save, "Review saved without a title"
  end

  test "should not save a review without content" do
    review = Review.new :title => "Lorem ipsum"
    assert_not review.save, "Review saved without a content"
  end
end
