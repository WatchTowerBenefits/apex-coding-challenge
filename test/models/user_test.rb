require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should be valid with valid attributes" do
    user = users(:one)
    assert user.valid?
  end

  test "should require first_name" do
    user = users(:one)
    user.first_name = nil
    assert_not user.valid?
    assert_includes user.errors[:first_name], "can't be blank"
  end

  test "should require last_name" do
    user = users(:one)
    user.last_name = nil
    assert_not user.valid?
    assert_includes user.errors[:last_name], "can't be blank"
  end

  test "should serialize tags as YAML" do
    user = users(:one)
    assert_equal ['frontend', 'backend', 'fullstack'], user.tags
    
    user.tags = ['new', 'tags']
    user.save!
    user.reload
    assert_equal ['new', 'tags'], user.tags
  end

  test "can create user with all attributes from fixtures" do
    user = users(:two)
    assert_equal "Bob", user.first_name
    assert_equal "leBuilder", user.last_name
    assert_equal "iCanFixIt@hotmail.com", user.email
    assert_equal 1, user.friend_count
    assert_equal ['builder'], user.tags
  end

  test "should handle empty tags array" do
    user = User.new(first_name: "Test", last_name: "User", tags: [])
    assert user.valid?
    assert_equal [], user.tags
  end
end
