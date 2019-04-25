require 'test_helper'

class TimeRangesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @time_range = time_ranges(:one)
  end

  test "should get index" do
    get time_ranges_url
    assert_response :success
  end

  test "should get new" do
    get new_time_range_url
    assert_response :success
  end

  test "should create time_range" do
    assert_difference('TimeRange.count') do
      post time_ranges_url, params: { time_range: { end_time: @time_range.end_time, start_time: @time_range.start_time } }
    end

    assert_redirected_to time_range_url(TimeRange.last)
  end

  test "should show time_range" do
    get time_range_url(@time_range)
    assert_response :success
  end

  test "should get edit" do
    get edit_time_range_url(@time_range)
    assert_response :success
  end

  test "should update time_range" do
    patch time_range_url(@time_range), params: { time_range: { end_time: @time_range.end_time, start_time: @time_range.start_time } }
    assert_redirected_to time_range_url(@time_range)
  end

  test "should destroy time_range" do
    assert_difference('TimeRange.count', -1) do
      delete time_range_url(@time_range)
    end

    assert_redirected_to time_ranges_url
  end
end
