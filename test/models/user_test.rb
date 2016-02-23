require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @user= User.create(last_name: "last", first_name: "first", email: "mail@mail.com",
      thumbnail: "me.png")
  end
 
  test "user must be valid" do
    assert @user.valid?
  end
  
  test "last name must be present" do
    @user.last_name = ""
    assert_not @user.valid?
  end 
  
  test "first name must be present" do
    @user.first_name = ""
    assert_not @user.valid?
  end
  
  test "email must be present" do
    @user.email = ""
    assert_not @user.valid?
  end 
  
  test "thumbnail must end in .gif, .jpg or .png." do
    @user.thumbnail = "invalid"
    assert_not @user.valid?
  end
  
  test "email must be valid." do
    @user.email = "invalid"
    assert_not @user.valid?
  end
  
  test "email must be unique." do
    @user.email = "MyString@mail.com"
    assert_not @user.valid?
  end
  
end
