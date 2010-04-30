require 'test_helper'

class TrabajoConsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trabajo_cons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trabajo_con" do
    assert_difference('TrabajoCon.count') do
      post :create, :trabajo_con => { }
    end

    assert_redirected_to trabajo_con_path(assigns(:trabajo_con))
  end

  test "should show trabajo_con" do
    get :show, :id => trabajo_cons(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => trabajo_cons(:one).to_param
    assert_response :success
  end

  test "should update trabajo_con" do
    put :update, :id => trabajo_cons(:one).to_param, :trabajo_con => { }
    assert_redirected_to trabajo_con_path(assigns(:trabajo_con))
  end

  test "should destroy trabajo_con" do
    assert_difference('TrabajoCon.count', -1) do
      delete :destroy, :id => trabajo_cons(:one).to_param
    end

    assert_redirected_to trabajo_cons_path
  end
end
