require 'test_helper'

class PacienteDoctorsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:paciente_doctors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create paciente_doctor" do
    assert_difference('PacienteDoctor.count') do
      post :create, :paciente_doctor => { }
    end

    assert_redirected_to paciente_doctor_path(assigns(:paciente_doctor))
  end

  test "should show paciente_doctor" do
    get :show, :id => paciente_doctors(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => paciente_doctors(:one).to_param
    assert_response :success
  end

  test "should update paciente_doctor" do
    put :update, :id => paciente_doctors(:one).to_param, :paciente_doctor => { }
    assert_redirected_to paciente_doctor_path(assigns(:paciente_doctor))
  end

  test "should destroy paciente_doctor" do
    assert_difference('PacienteDoctor.count', -1) do
      delete :destroy, :id => paciente_doctors(:one).to_param
    end

    assert_redirected_to paciente_doctors_path
  end
end
