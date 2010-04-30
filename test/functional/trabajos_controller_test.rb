require 'test_helper'

class TrabajosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trabajos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trabajo" do
    assert_difference('Trabajo.count') do
      post :create, :trabajo => { }
    end

    assert_redirected_to trabajo_path(assigns(:trabajo))
  end

  test "should show trabajo" do
    get :show, :id => trabajos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => trabajos(:one).to_param
    assert_response :success
  end

  test "should update trabajo" do
    put :update, :id => trabajos(:one).to_param, :trabajo => { }
    assert_redirected_to trabajo_path(assigns(:trabajo))
  end

  test "should destroy trabajo" do
    assert_difference('Trabajo.count', -1) do
      delete :destroy, :id => trabajos(:one).to_param
    end

    assert_redirected_to trabajos_path
  end
end
