require 'test_helper'

class MonstersControllerTest < ActionController::TestCase
  setup do
    @monster = monsters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:monsters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create monster" do
    assert_difference('Monster.count') do
      post :create, monster: { attack_type: @monster.attack_type, name: @monster.name, num_red2: @monster.num_red2, num_red3: @monster.num_red3, num_red4: @monster.num_red4, num_tan2: @monster.num_tan2, num_tan3: @monster.num_tan3, num_tan4: @monster.num_tan4, set_id: @monster.set_id, type1_id: @monster.type1_id, type2_id: @monster.type2_id }
    end

    assert_redirected_to monster_path(assigns(:monster))
  end

  test "should show monster" do
    get :show, id: @monster
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @monster
    assert_response :success
  end

  test "should update monster" do
    put :update, id: @monster, monster: { attack_type: @monster.attack_type, name: @monster.name, num_red2: @monster.num_red2, num_red3: @monster.num_red3, num_red4: @monster.num_red4, num_tan2: @monster.num_tan2, num_tan3: @monster.num_tan3, num_tan4: @monster.num_tan4, set_id: @monster.set_id, type1_id: @monster.type1_id, type2_id: @monster.type2_id }
    assert_redirected_to monster_path(assigns(:monster))
  end

  test "should destroy monster" do
    assert_difference('Monster.count', -1) do
      delete :destroy, id: @monster
    end

    assert_redirected_to monsters_path
  end
end
