require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save book without name" do
    User.new :email => 'asdasd@ffffffasd.com'
    book = Book.new :user_id => user.id, :author => 'Xavér'
    assert_not book.save, "Saved the book without a title"
  end

  test "should not save book without author" do
    User.new :email => 'asdasd@ffffffasd.com'
    book = Book.new :user_id => user.id, :title => 'Trónok harca'
    assert_not book.save, "Saved the book without an author"
  end

  test "should not save an empty book" do
    book = Book.new
    assert_not book.save, "Saved an empty book"
  end
end
