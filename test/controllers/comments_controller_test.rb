require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @comment = comments(:one)
    @post = posts(:one)
    @user = users(:one)
    sign_in @user
  end

  test 'should create comment' do
    assert_difference('Comment.count') do
      post comments_url, params: { comment: { body: 'Body', post_id: @post.id, user_id: @user.id, replying_to_user: nil, replying_to_comment: nil } }
    end

    assert_redirected_to post_url(@post)
  end

  test 'should update comment' do
    patch comment_url(@comment), params: { comment: { body: 'New Body Text' } }
    assert_redirected_to post_url(@comment.post_id)
  end

  test 'should destroy comment' do
    post = @comment.post_id
    assert_difference('Comment.count', -1) do
      delete comment_url(@comment)
    end

    assert_redirected_to post_url(post)
  end
end
