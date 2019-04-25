require "application_system_test_case"

class MultimediaTest < ApplicationSystemTestCase
  setup do
    @multimedium = multimedia(:one)
  end

  test "visiting the index" do
    visit multimedia_url
    assert_selector "h1", text: "Multimedia"
  end

  test "creating a Multimedium" do
    visit multimedia_url
    click_on "New Multimedium"

    fill_in "Event", with: @multimedium.event_id
    fill_in "Multimedia type", with: @multimedium.multimedia_type_id
    fill_in "Name", with: @multimedium.name
    fill_in "Url", with: @multimedium.url
    click_on "Create Multimedium"

    assert_text "Multimedium was successfully created"
    click_on "Back"
  end

  test "updating a Multimedium" do
    visit multimedia_url
    click_on "Edit", match: :first

    fill_in "Event", with: @multimedium.event_id
    fill_in "Multimedia type", with: @multimedium.multimedia_type_id
    fill_in "Name", with: @multimedium.name
    fill_in "Url", with: @multimedium.url
    click_on "Update Multimedium"

    assert_text "Multimedium was successfully updated"
    click_on "Back"
  end

  test "destroying a Multimedium" do
    visit multimedia_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Multimedium was successfully destroyed"
  end
end
