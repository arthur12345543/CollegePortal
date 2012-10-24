require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get news" do
    get :news
    assert_response :success
  end

  test "should get showbill" do
    get :showbill
    assert_response :success
  end

  test "should get forum" do
    get :forum
    assert_response :success
  end

  test "should get fotogalerely" do
    get :fotogalerely
    assert_response :success
  end

  test "should get toabiturince" do
    get :toabiturince
    assert_response :success
  end

  test "should get filestorage" do
    get :filestorage
    assert_response :success
  end

end
