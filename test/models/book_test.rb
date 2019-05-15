require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save book without name" do
    User.new :email => 'asdasd@ffffffasd.com'
    book = Book.new(user_id: user.id)
    assert_not book.save, "Saved the book without a title"
  end
end
