require 'test_helper'

class MultimediaTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @multimedia_type = multimedia_types(:one)
  end

  test "should get index" do
    get multimedia_types_url
    assert_response :success
  end

  test "should get new" do
    get new_multimedia_type_url
    assert_response :success
  end

  test "should create multimedia_type" do
    assert_difference('MultimediaType.count') do
      post multimedia_types_url, params: { multimedia_type: { multimedia_type: @multimedia_type.multimedia_type } }
    end

    assert_redirected_to multimedia_type_url(MultimediaType.last)
  end

  test "should show multimedia_type" do
    get multimedia_type_url(@multimedia_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_multimedia_type_url(@multimedia_type)
    assert_response :success
  end

  test "should update multimedia_type" do
    patch multimedia_type_url(@multimedia_type), params: { multimedia_type: { multimedia_type: @multimedia_type.multimedia_type } }
    assert_redirected_to multimedia_type_url(@multimedia_type)
  end

  test "should destroy multimedia_type" do
    assert_difference('MultimediaType.count', -1) do
      delete multimedia_type_url(@multimedia_type)
    end

    assert_redirected_to multimedia_types_url
  end
end
