require "application_system_test_case"

class GceRegionsTest < ApplicationSystemTestCase
  setup do
    @gce_region = gce_regions(:one)
  end

  test "visiting the index" do
    visit gce_regions_url
    assert_selector "h1", text: "Gce Regions"
  end

  test "creating a Gce region" do
    visit gce_regions_url
    click_on "New Gce Region"

    fill_in "Address", with: @gce_region.address
    fill_in "Description", with: @gce_region.description
    fill_in "Is Active", with: @gce_region.is_active
    fill_in "Name", with: @gce_region.name
    click_on "Create Gce region"

    assert_text "Gce region was successfully created"
    click_on "Back"
  end

  test "updating a Gce region" do
    visit gce_regions_url
    click_on "Edit", match: :first

    fill_in "Address", with: @gce_region.address
    fill_in "Description", with: @gce_region.description
    fill_in "Is Active", with: @gce_region.is_active
    fill_in "Name", with: @gce_region.name
    click_on "Update Gce region"

    assert_text "Gce region was successfully updated"
    click_on "Back"
  end

  test "destroying a Gce region" do
    visit gce_regions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Gce region was successfully destroyed"
  end
end
