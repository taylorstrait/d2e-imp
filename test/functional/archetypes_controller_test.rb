require 'test_helper'

class ArchetypesControllerTest < ActionController::TestCase
  setup do
    @archetype = archetypes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:archetypes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create archetype" do
    assert_difference('Archetype.count') do
      post :create, archetype: {  }
    end

    assert_redirected_to archetype_path(assigns(:archetype))
  end

  test "should show archetype" do
    get :show, id: @archetype
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @archetype
    assert_response :success
  end

  test "should update archetype" do
    put :update, id: @archetype, archetype: {  }
    assert_redirected_to archetype_path(assigns(:archetype))
  end

  test "should destroy archetype" do
    assert_difference('Archetype.count', -1) do
      delete :destroy, id: @archetype
    end

    assert_redirected_to archetypes_path
  end
end
