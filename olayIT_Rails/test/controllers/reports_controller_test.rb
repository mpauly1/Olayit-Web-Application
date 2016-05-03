require 'test_helper'

class ReportsControllerTest < ActionController::TestCase
  test "should get reportListing" do
    get :reportListing
    assert_response :success
  end

  test "should get customerList" do
    get :customerList
    assert_response :success
  end

  test "should get productList" do
    get :productList
    assert_response :success
  end

  test "should get saleList" do
    get :saleList
    assert_response :success
  end

end
