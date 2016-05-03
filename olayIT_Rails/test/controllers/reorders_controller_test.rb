require 'test_helper'

class ReordersControllerTest < ActionController::TestCase
  setup do
    @reorder = reorders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reorders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reorder" do
    assert_difference('Reorder.count') do
      post :create, reorder: { expecteddelivery: @reorder.expecteddelivery, qtyorder: @reorder.qtyorder, reorderdate: @reorder.reorderdate, squad_id: @reorder.squad_id }
    end

    assert_redirected_to reorder_path(assigns(:reorder))
  end

  test "should show reorder" do
    get :show, id: @reorder
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reorder
    assert_response :success
  end

  test "should update reorder" do
    patch :update, id: @reorder, reorder: { expecteddelivery: @reorder.expecteddelivery, qtyorder: @reorder.qtyorder, reorderdate: @reorder.reorderdate, squad_id: @reorder.squad_id }
    assert_redirected_to reorder_path(assigns(:reorder))
  end

  test "should destroy reorder" do
    assert_difference('Reorder.count', -1) do
      delete :destroy, id: @reorder
    end

    assert_redirected_to reorders_path
  end
end
