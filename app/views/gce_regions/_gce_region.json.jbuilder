json.extract! gce_region, :id, :name, :address, :description, :default_zones, :is_active, :created_at, :updated_at
json.url gce_region_url(gce_region, format: :json)
