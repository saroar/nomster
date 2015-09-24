require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "humanized " do
    result = Comment.new(:rating => '1_star').humanized_rating
    assert_equal "one star", result 
  end
end
