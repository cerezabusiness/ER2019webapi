require "application_system_test_case"

class TimeRangesTest < ApplicationSystemTestCase
  setup do
    @time_range = time_ranges(:one)
  end

  test "visiting the index" do
    visit time_ranges_url
    assert_selector "h1", text: "Time Ranges"
  end

  test "creating a Time range" do
    visit time_ranges_url
    click_on "New Time Range"

    fill_in "End time", with: @time_range.end_time
    fill_in "Start time", with: @time_range.start_time
    click_on "Create Time range"

    assert_text "Time range was successfully created"
    click_on "Back"
  end

  test "updating a Time range" do
    visit time_ranges_url
    click_on "Edit", match: :first

    fill_in "End time", with: @time_range.end_time
    fill_in "Start time", with: @time_range.start_time
    click_on "Update Time range"

    assert_text "Time range was successfully updated"
    click_on "Back"
  end

  test "destroying a Time range" do
    visit time_ranges_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Time range was successfully destroyed"
  end
end
