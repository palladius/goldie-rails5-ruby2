class AddMachineTypesToGceRegion < ActiveRecord::Migration[5.2]
  def change
    add_column :gce_regions, :machine_types, :string
    add_column :gce_regions, :cpus, :string
    add_column :gce_regions, :resources, :string
  end
end
