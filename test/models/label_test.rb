require "test_helper"

class LabelTest < ActiveSupport::TestCase
  setup do
    @user = users(:user1)
  end

  test "don't save label without user" do
    label = Label.new(user_id: nil, title: 'title')
    assert_not label.save, "Saved the label without a user"
  end

  test "don't save label without title" do
    label = Label.new(user_id: @user.id, title: nil)
    assert_not label.save, "Saved the label without a title"
  end

  test "don't save label with title having more than 20 characters" do
    label = Label.new(user_id: @user.id, title: "this title has more than 20 characters")
    assert_not label.save, "Saved the label with title having more than 20 characters"
  end
  
  test "don't save label if it already exists" do
    label1 = Label.create(user_id: @user.id, title: "Label 1")
    label2 = Label.new(user_id: @user.id, title: "Label 1")
    assert_not label2.save, "Saved the second label even if it already exists"
  end

end
