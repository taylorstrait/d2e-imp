require 'test_helper'

class AdventurersControllerTest < ActionController::TestCase
  setup do
    @adventurer = adventurers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:adventurers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create adventurer" do
    assert_difference('Adventurer.count') do
      post :create, adventurer: {  }
    end

    assert_redirected_to adventurer_path(assigns(:adventurer))
  end

  test "should show adventurer" do
    get :show, id: @adventurer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @adventurer
    assert_response :success
  end

  test "should update adventurer" do
    put :update, id: @adventurer, adventurer: {  }
    assert_redirected_to adventurer_path(assigns(:adventurer))
  end

  test "should destroy adventurer" do
    assert_difference('Adventurer.count', -1) do
      delete :destroy, id: @adventurer
    end

    assert_redirected_to adventurers_path
  end
end
