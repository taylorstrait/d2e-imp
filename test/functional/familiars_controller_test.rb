require 'test_helper'

class FamiliarsControllerTest < ActionController::TestCase
  setup do
    @familiar = familiars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:familiars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create familiar" do
    assert_difference('Familiar.count') do
      post :create, familiar: {  }
    end

    assert_redirected_to familiar_path(assigns(:familiar))
  end

  test "should show familiar" do
    get :show, id: @familiar
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @familiar
    assert_response :success
  end

  test "should update familiar" do
    put :update, id: @familiar, familiar: {  }
    assert_redirected_to familiar_path(assigns(:familiar))
  end

  test "should destroy familiar" do
    assert_difference('Familiar.count', -1) do
      delete :destroy, id: @familiar
    end

    assert_redirected_to familiars_path
  end
end
