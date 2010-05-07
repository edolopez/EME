require 'test_helper'

class ClinicasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clinicas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create clinica" do
    assert_difference('Clinica.count') do
      post :create, :clinica => { }
    end

    assert_redirected_to clinica_path(assigns(:clinica))
  end

  test "should show clinica" do
    get :show, :id => clinicas(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => clinicas(:one).to_param
    assert_response :success
  end

  test "should update clinica" do
    put :update, :id => clinicas(:one).to_param, :clinica => { }
    assert_redirected_to clinica_path(assigns(:clinica))
  end

  test "should destroy clinica" do
    assert_difference('Clinica.count', -1) do
      delete :destroy, :id => clinicas(:one).to_param
    end

    assert_redirected_to clinicas_path
  end
end
