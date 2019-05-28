require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save category without name" do
    category = Category.new
    assert_not category.save, "Saved the category without a name"
  end

  test "should save category with name" do
    category = Category.new :name => 'Fantasy'
    assert category.save, "Couldnt save category with name"
  end
end
