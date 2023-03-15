require "test_helper"

class StudiesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get studies_create_url
    assert_response :success
  end

  test "should get update" do
    get studies_update_url
    assert_response :success
  end

  test "should get edit" do
    get studies_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get studies_destroy_url
    assert_response :success
  end
end
