require 'test_helper'

class OverlordCardsControllerTest < ActionController::TestCase
  setup do
    @overlord_card = overlord_cards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:overlord_cards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create overlord_card" do
    assert_difference('OverlordCard.count') do
      post :create, overlord_card: {  }
    end

    assert_redirected_to overlord_card_path(assigns(:overlord_card))
  end

  test "should show overlord_card" do
    get :show, id: @overlord_card
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @overlord_card
    assert_response :success
  end

  test "should update overlord_card" do
    put :update, id: @overlord_card, overlord_card: {  }
    assert_redirected_to overlord_card_path(assigns(:overlord_card))
  end

  test "should destroy overlord_card" do
    assert_difference('OverlordCard.count', -1) do
      delete :destroy, id: @overlord_card
    end

    assert_redirected_to overlord_cards_path
  end
end
