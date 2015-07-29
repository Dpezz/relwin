require 'test_helper'

class InBuysControllerTest < ActionController::TestCase
  setup do
    @in_buy = in_buys(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:in_buys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create in_buy" do
    assert_difference('InBuy.count') do
      post :create, in_buy: { buy_id: @in_buy.buy_id, product_id: @in_buy.product_id, unit: @in_buy.unit }
    end

    assert_redirected_to in_buy_path(assigns(:in_buy))
  end

  test "should show in_buy" do
    get :show, id: @in_buy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @in_buy
    assert_response :success
  end

  test "should update in_buy" do
    patch :update, id: @in_buy, in_buy: { buy_id: @in_buy.buy_id, product_id: @in_buy.product_id, unit: @in_buy.unit }
    assert_redirected_to in_buy_path(assigns(:in_buy))
  end

  test "should destroy in_buy" do
    assert_difference('InBuy.count', -1) do
      delete :destroy, id: @in_buy
    end

    assert_redirected_to in_buys_path
  end
end
