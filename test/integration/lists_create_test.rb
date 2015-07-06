require 'test_helper'

class ListsCreateTest < ActionDispatch::IntegrationTest
  
	test "should not create list with invalid info" do
		get new_list_path
		assert_no_difference 'List.count' do
			post lists_path, list: { title: nil }
		end
		assert_template 'lists/new'
		assert_select 'div.field_with_errors'
	end

  test "should create list" do 
  	get new_list_path
  	assert_difference 'List.count', 1 do
  		post lists_path, list: { title: "Sample Title" }
  	end  	
  end
end
