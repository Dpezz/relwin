require 'test_helper'

class InOrdersControllerTest < ActionController::TestCase
  setup do
    @in_order = in_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:in_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create in_order" do
    assert_difference('InOrder.count') do
      post :create, in_order: { order_id: @in_order.order_id, product_id: @in_order.product_id, sales_check: @in_order.sales_check, unit_o: @in_order.unit_o, unit_r: @in_order.unit_r }
    end

    assert_redirected_to in_order_path(assigns(:in_order))
  end

  test "should show in_order" do
    get :show, id: @in_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @in_order
    assert_response :success
  end

  test "should update in_order" do
    patch :update, id: @in_order, in_order: { order_id: @in_order.order_id, product_id: @in_order.product_id, sales_check: @in_order.sales_check, unit_o: @in_order.unit_o, unit_r: @in_order.unit_r }
    assert_redirected_to in_order_path(assigns(:in_order))
  end

  test "should destroy in_order" do
    assert_difference('InOrder.count', -1) do
      delete :destroy, id: @in_order
    end

    assert_redirected_to in_orders_path
  end
end
