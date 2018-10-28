require "application_system_test_case"

class GceZonesTest < ApplicationSystemTestCase
  setup do
    @gce_zone = gce_zones(:one)
  end

  test "visiting the index" do
    visit gce_zones_url
    assert_selector "h1", text: "Gce Zones"
  end

  test "creating a Gce zone" do
    visit gce_zones_url
    click_on "New Gce Zone"

    fill_in "Gceregion", with: @gce_zone.GceRegion_id
    fill_in "Is Active", with: @gce_zone.is_active
    fill_in "Name", with: @gce_zone.name
    click_on "Create Gce zone"

    assert_text "Gce zone was successfully created"
    click_on "Back"
  end

  test "updating a Gce zone" do
    visit gce_zones_url
    click_on "Edit", match: :first

    fill_in "Gceregion", with: @gce_zone.GceRegion_id
    fill_in "Is Active", with: @gce_zone.is_active
    fill_in "Name", with: @gce_zone.name
    click_on "Update Gce zone"

    assert_text "Gce zone was successfully updated"
    click_on "Back"
  end

  test "destroying a Gce zone" do
    visit gce_zones_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Gce zone was successfully destroyed"
  end
end
