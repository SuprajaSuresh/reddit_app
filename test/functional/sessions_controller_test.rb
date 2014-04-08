require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
	test "should destroy session" do
 		delete :destroy 
 		assert_nil(cookies[:client_cookie], "Cookie not nil" )
 		assert_redirected_to root_path
	end
end
