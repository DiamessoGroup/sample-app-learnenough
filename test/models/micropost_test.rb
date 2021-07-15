# frozen_string_literal: true

require 'test_helper'

class MicropostTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @micropost = @user.microposts.build(content: 'Lorem Ipsum')
  end

  test 'micropost should be valid' do
    assert @micropost.valid?
  end

  test 'user_id should be present' do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end

  test 'content should be present' do
    @micropost.content = '  '
    assert_not @micropost.valid?
  end

  test 'content should be at most 140 characters' do
    @micropost.content = 'a' * 141
    # Ensures that @micropost.valid? is false.
    assert_not @micropost.valid?
  end

  test "order should be most recent" do
    # Ensures that expected == actual is true.
    assert_equal(microposts(:most_recent), Micropost.first)

  end
end
