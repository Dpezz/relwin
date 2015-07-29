require 'test_helper'

class InTerminalsControllerTest < ActionController::TestCase
  setup do
    @in_terminal = in_terminals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:in_terminals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create in_terminal" do
    assert_difference('InTerminal.count') do
      post :create, in_terminal: { active: @in_terminal.active, end_date: @in_terminal.end_date, end_p: @in_terminal.end_p, start_date: @in_terminal.start_date, start_p: @in_terminal.start_p, terminal_id: @in_terminal.terminal_id, total_p: @in_terminal.total_p, user_id: @in_terminal.user_id, vendor_id: @in_terminal.vendor_id }
    end

    assert_redirected_to in_terminal_path(assigns(:in_terminal))
  end

  test "should show in_terminal" do
    get :show, id: @in_terminal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @in_terminal
    assert_response :success
  end

  test "should update in_terminal" do
    patch :update, id: @in_terminal, in_terminal: { active: @in_terminal.active, end_date: @in_terminal.end_date, end_p: @in_terminal.end_p, start_date: @in_terminal.start_date, start_p: @in_terminal.start_p, terminal_id: @in_terminal.terminal_id, total_p: @in_terminal.total_p, user_id: @in_terminal.user_id, vendor_id: @in_terminal.vendor_id }
    assert_redirected_to in_terminal_path(assigns(:in_terminal))
  end

  test "should destroy in_terminal" do
    assert_difference('InTerminal.count', -1) do
      delete :destroy, id: @in_terminal
    end

    assert_redirected_to in_terminals_path
  end
end
