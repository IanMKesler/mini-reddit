require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user = User.create(username: "Example User", email: "user@example.com")
    @post = @user.posts.create(body: "Example post.")        
  end

  test "should be valid" do
    assert @post.valid?
  end

  test "post body should be present" do
    @post.body = "     "
    assert_not @post.valid?
  end

  test "post body cannot exceed 2000 characters" do
    @post.body = "a" * 2001
    assert_not @post.valid?
  end
end
