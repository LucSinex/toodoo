require 'test_helper'

class GoalTest < ActiveSupport::TestCase
  def setup
  	@goal = goals(:one)
  end

  test "should be valid" do
  	assert @goal.valid?
  end

  test "content should be present" do
  	@goal.content = ""
  	assert_not @goal.valid?  	
  end
end
