require 'test_helper'

class ListsControllerTest < ActionController::TestCase
  def setup
  	@list = List.new(title: "Run a mile", id: 1)
  	@list.save
  end

  test "should get show" do
    get(:show, { id: 1 })
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
