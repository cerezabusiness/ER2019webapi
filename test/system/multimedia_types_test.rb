require "application_system_test_case"

class MultimediaTypesTest < ApplicationSystemTestCase
  setup do
    @multimedia_type = multimedia_types(:one)
  end

  test "visiting the index" do
    visit multimedia_types_url
    assert_selector "h1", text: "Multimedia Types"
  end

  test "creating a Multimedia type" do
    visit multimedia_types_url
    click_on "New Multimedia Type"

    fill_in "Multimedia type", with: @multimedia_type.multimedia_type
    click_on "Create Multimedia type"

    assert_text "Multimedia type was successfully created"
    click_on "Back"
  end

  test "updating a Multimedia type" do
    visit multimedia_types_url
    click_on "Edit", match: :first

    fill_in "Multimedia type", with: @multimedia_type.multimedia_type
    click_on "Update Multimedia type"

    assert_text "Multimedia type was successfully updated"
    click_on "Back"
  end

  test "destroying a Multimedia type" do
    visit multimedia_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Multimedia type was successfully destroyed"
  end
end
