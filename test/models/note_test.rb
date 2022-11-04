require "test_helper"

class NoteTest < ActiveSupport::TestCase
  setup do
    @user = users(:user1)
    @label = labels(:label1)
  end

  test "should not save note without user" do
    note = Note.new(user_id: nil, label_id: @label.id, head: 'head here' , body: nil, deadline: nil)
    assert_not note.save, "Saved the note without a user"
  end

  test "should not save note without anything" do
    note = Note.new(user_id: @user.id, label_id: nil, head: nil , body: nil, deadline: nil)
    assert_not note.save, "Saved the note without anything"
  end

  test "should not save note without head" do
    note = Note.new(user_id: @user.id, label_id: @label.id, head: nil , body: nil, deadline: nil)
    assert_not note.save, "Saved the note without a head"
  end

  test "should not save note without label" do
    note = Note.new(user_id: @user.id, label_id: nil, head: 'note head here' , body: nil, deadline: nil)
    assert_not note.save, "Saved the note without a head"
  end

  test "should not save note with more than 30 characters" do
    note = Note.new(user_id: @user.id, label_id: @label.id, head: 'the head of this note really has more than 30 characters' , body: nil, deadline: nil)
    assert_not note.save, "Saved the note without a head"
  end

end
