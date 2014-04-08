require 'test_helper'

class TopStoriesControllerTest < ActionController::TestCase
	test "should get index" do
	  get :index
	  assert_response :success
	  assert_not_nil assigns(:response)
	  assert_not_nil assigns(:res)
	  assert_not_nil assigns(:stories)
	  assert_template :index
	end
end
