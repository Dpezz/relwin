require 'test_helper'

class InTaxesControllerTest < ActionController::TestCase
  setup do
    @in_tax = in_taxes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:in_taxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create in_tax" do
    assert_difference('InTax.count') do
      post :create, in_tax: { product_id: @in_tax.product_id, tax_id: @in_tax.tax_id }
    end

    assert_redirected_to in_tax_path(assigns(:in_tax))
  end

  test "should show in_tax" do
    get :show, id: @in_tax
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @in_tax
    assert_response :success
  end

  test "should update in_tax" do
    patch :update, id: @in_tax, in_tax: { product_id: @in_tax.product_id, tax_id: @in_tax.tax_id }
    assert_redirected_to in_tax_path(assigns(:in_tax))
  end

  test "should destroy in_tax" do
    assert_difference('InTax.count', -1) do
      delete :destroy, id: @in_tax
    end

    assert_redirected_to in_taxes_path
  end
end
