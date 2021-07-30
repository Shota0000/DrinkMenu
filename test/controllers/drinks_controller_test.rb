require "test_helper"

class DrinksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get drinks_index_url
    assert_response :success
  end

  test "should get show" do
    get drinks_show_url
    assert_response :success
  end

  test "should get edit" do
    get drinks_edit_url
    assert_response :success
  end

  test "should get create" do
    get drinks_create_url
    assert_response :success
  end

  test "should get update" do
    get drinks_update_url
    assert_response :success
  end

  test "should get destroy" do
    get drinks_destroy_url
    assert_response :success
  end
end
