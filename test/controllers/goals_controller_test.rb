require 'test_helper'

class GoalsControllerTest < ActionController::TestCase
  def setup
  	@goal = goals(:one)
  end

  test "should create goal" do
    assert_difference('Goal.count') do
       post :create, { list_id: lists(:one).id, goal: { content: "New", done: false } }
    end
  end

  test "should destroy goal" do
    assert_difference('Goal.count', -1) do
      delete :destroy, id: @goal.id, list_id: @goal.list_id
    end
  end

end
