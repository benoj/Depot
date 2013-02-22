require 'test_helper'

class ProducsControllerTest < ActionController::TestCase
  setup do
    @produc = producs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:producs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create produc" do
    assert_difference('Produc.count') do
      post :create, produc: { description: @produc.description, image_url: @produc.image_url, price: @produc.price, title: @produc.title }
    end

    assert_redirected_to produc_path(assigns(:produc))
  end

  test "should show produc" do
    get :show, id: @produc
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @produc
    assert_response :success
  end

  test "should update produc" do
    put :update, id: @produc, produc: { description: @produc.description, image_url: @produc.image_url, price: @produc.price, title: @produc.title }
    assert_redirected_to produc_path(assigns(:produc))
  end

  test "should destroy produc" do
    assert_difference('Produc.count', -1) do
      delete :destroy, id: @produc
    end

    assert_redirected_to producs_path
  end
end
