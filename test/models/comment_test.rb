require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @user = User.create(username: "Example User", email: "user@example.com")
    @post = @user.posts.create(body: "Example post.")
    @comment = Comment.create(body: "Example comment", user_id: @user.id, post_id: @post.id)        
  end

  test "comment is valid" do
    assert @comment.valid?
  end

  test "validates body presence" do
    @comment.body = "    "
    assert_not @comment.valid?
  end

  test "validates maximum body length of 2000" do
    @comment.body = "a" * 2001
    assert_not @comment.valid?
  end
end
