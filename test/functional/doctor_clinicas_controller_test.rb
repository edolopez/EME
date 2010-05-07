require 'test_helper'

class DoctorClinicasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:doctor_clinicas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create doctor_clinica" do
    assert_difference('DoctorClinica.count') do
      post :create, :doctor_clinica => { }
    end

    assert_redirected_to doctor_clinica_path(assigns(:doctor_clinica))
  end

  test "should show doctor_clinica" do
    get :show, :id => doctor_clinicas(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => doctor_clinicas(:one).to_param
    assert_response :success
  end

  test "should update doctor_clinica" do
    put :update, :id => doctor_clinicas(:one).to_param, :doctor_clinica => { }
    assert_redirected_to doctor_clinica_path(assigns(:doctor_clinica))
  end

  test "should destroy doctor_clinica" do
    assert_difference('DoctorClinica.count', -1) do
      delete :destroy, :id => doctor_clinicas(:one).to_param
    end

    assert_redirected_to doctor_clinicas_path
  end
end
