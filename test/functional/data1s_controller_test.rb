require 'test_helper'

class Data1sControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

end
