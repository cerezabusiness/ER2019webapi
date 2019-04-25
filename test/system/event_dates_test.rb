require "application_system_test_case"

class EventDatesTest < ApplicationSystemTestCase
  setup do
    @event_date = event_dates(:one)
  end

  test "visiting the index" do
    visit event_dates_url
    assert_selector "h1", text: "Event Dates"
  end

  test "creating a Event date" do
    visit event_dates_url
    click_on "New Event Date"

    fill_in "Date", with: @event_date.date
    fill_in "Event", with: @event_date.event_id
    click_on "Create Event date"

    assert_text "Event date was successfully created"
    click_on "Back"
  end

  test "updating a Event date" do
    visit event_dates_url
    click_on "Edit", match: :first

    fill_in "Date", with: @event_date.date
    fill_in "Event", with: @event_date.event_id
    click_on "Update Event date"

    assert_text "Event date was successfully updated"
    click_on "Back"
  end

  test "destroying a Event date" do
    visit event_dates_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Event date was successfully destroyed"
  end
end
