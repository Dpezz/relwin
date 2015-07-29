require 'test_helper'

class InVendorsControllerTest < ActionController::TestCase
  setup do
    @in_vendor = in_vendors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:in_vendors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create in_vendor" do
    assert_difference('InVendor.count') do
      post :create, in_vendor: { end_date: @in_vendor.end_date, is_active: @in_vendor.is_active, start_date: @in_vendor.start_date, user_id: @in_vendor.user_id, vendor_id: @in_vendor.vendor_id }
    end

    assert_redirected_to in_vendor_path(assigns(:in_vendor))
  end

  test "should show in_vendor" do
    get :show, id: @in_vendor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @in_vendor
    assert_response :success
  end

  test "should update in_vendor" do
    patch :update, id: @in_vendor, in_vendor: { end_date: @in_vendor.end_date, is_active: @in_vendor.is_active, start_date: @in_vendor.start_date, user_id: @in_vendor.user_id, vendor_id: @in_vendor.vendor_id }
    assert_redirected_to in_vendor_path(assigns(:in_vendor))
  end

  test "should destroy in_vendor" do
    assert_difference('InVendor.count', -1) do
      delete :destroy, id: @in_vendor
    end

    assert_redirected_to in_vendors_path
  end
end
