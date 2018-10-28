require 'test_helper'

class GceRegionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gce_region = gce_regions(:one)
  end

  test "should get index" do
    get gce_regions_url
    assert_response :success
  end

  test "should get new" do
    get new_gce_region_url
    assert_response :success
  end

  test "should create gce_region" do
    assert_difference('GceRegion.count') do
      post gce_regions_url, params: { gce_region: { address: @gce_region.address, description: @gce_region.description, is_active: @gce_region.is_active, name: @gce_region.name } }
    end

    assert_redirected_to gce_region_url(GceRegion.last)
  end

  test "should show gce_region" do
    get gce_region_url(@gce_region)
    assert_response :success
  end

  test "should get edit" do
    get edit_gce_region_url(@gce_region)
    assert_response :success
  end

  test "should update gce_region" do
    patch gce_region_url(@gce_region), params: { gce_region: { address: @gce_region.address, description: @gce_region.description, is_active: @gce_region.is_active, name: @gce_region.name } }
    assert_redirected_to gce_region_url(@gce_region)
  end

  test "should destroy gce_region" do
    assert_difference('GceRegion.count', -1) do
      delete gce_region_url(@gce_region)
    end

    assert_redirected_to gce_regions_url
  end
end
