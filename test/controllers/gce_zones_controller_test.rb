require 'test_helper'

class GceZonesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gce_zone = gce_zones(:one)
  end

  test "should get index" do
    get gce_zones_url
    assert_response :success
  end

  test "should get new" do
    get new_gce_zone_url
    assert_response :success
  end

  test "should create gce_zone" do
    assert_difference('GceZone.count') do
      post gce_zones_url, params: { gce_zone: { GceRegion_id: @gce_zone.GceRegion_id, is_active: @gce_zone.is_active, name: @gce_zone.name } }
    end

    assert_redirected_to gce_zone_url(GceZone.last)
  end

  test "should show gce_zone" do
    get gce_zone_url(@gce_zone)
    assert_response :success
  end

  test "should get edit" do
    get edit_gce_zone_url(@gce_zone)
    assert_response :success
  end

  test "should update gce_zone" do
    patch gce_zone_url(@gce_zone), params: { gce_zone: { GceRegion_id: @gce_zone.GceRegion_id, is_active: @gce_zone.is_active, name: @gce_zone.name } }
    assert_redirected_to gce_zone_url(@gce_zone)
  end

  test "should destroy gce_zone" do
    assert_difference('GceZone.count', -1) do
      delete gce_zone_url(@gce_zone)
    end

    assert_redirected_to gce_zones_url
  end
end
