require "test_helper"

class UserTest < ActiveSupport::TestCase
  
  test "save user with complete details" do
    user = User.new(email: 'test@test.com', encrypted_password: BCrypt::Password.create('123456'))
    assert_not user.save, "Did not save user!"
  end

  test "don't save user without email" do
    user = User.new(email: nil, encrypted_password: BCrypt::Password.create('123456'))
    assert_not user.save, "Saved the user without an email"
  end

  test "don't save user without password" do
    user = User.new(email: "test@test.com", encrypted_password: nil)
    assert_not user.save, "Saved the user without a password"
  end

  test "don't save user if email is not unique" do
    first_user = User.create(email: "test@test.com", encrypted_password: BCrypt::Password.create('123456'))
    second_user = User.new(email: "test@test.com", encrypted_password: BCrypt::Password.create('password'))
    assert_not second_user.save, "saved user even if email is not unique"
  end

  test "don't save user with invalid email" do
    user = User.new(email: 'test', encrypted_password: BCrypt::Password.create('123456'))
    assert_not user.save, "Saved the user with invalid email"
  end

  test "don't save user with password of less than 6 characters" do
    user = User.new(email: "test@test.com", encrypted_password: BCrypt::Password.create('12345'))
    assert_not user.save, "Saved the user with password of less than 6 characters"
  end

end