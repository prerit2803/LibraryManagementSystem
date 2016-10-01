require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user=User.create({full_name: 'Edward Gehringer', email:'edgeh12@ncsu.edu',password:'abcd12',password_confirm:'abcd12',can_book:1,admin:false, usertype:2,check:false})
  end
  test "user should be valid" do
    assert @user.valid?
   end
  test "user should have a full name" do
    @user.full_name=''
    assert_not @user.valid?
  end
  test "user should have an email address" do
    @user.email=''
    assert_not @user.valid?
  end
  test "user should have unique email address" do
    @user.save
    @user2=@user.dup
    @user2.email = @user.email.upcase
    assert_not @user2.valid?
  end
  test "the fullname should not be too long" do
    @user.full_name="a"*41
    assert_not @user.valid?
  end
  test "the email should not be too long" do
    @user.full_name="a"*101+"@ncsu.edu"
    assert_not @user.valid?
  end
  test "email should accept valid addresses" do
    valid_addresses = %w[user@ncsu.edu USER@ncsu.EDU U_USER@ncsu.edu.org
                         fname.lname@ncsu.edu]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end
  test "user should have a password" do
    @user.password="      "
    assert_not @user.valid?
  end
  test "the password should not be too short" do
    @user.password="aa"
    assert_not @user.valid?
  end
  test "user should have a value in admin column" do
    @user.admin=false
    assert @user.valid?
  end
end