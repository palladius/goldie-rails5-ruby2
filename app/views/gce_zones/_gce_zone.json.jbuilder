json.extract! gce_zone, :id, :name, :is_active, :gce_region_id, :created_at, :updated_at
json.url gce_zone_url(gce_zone, format: :json)
