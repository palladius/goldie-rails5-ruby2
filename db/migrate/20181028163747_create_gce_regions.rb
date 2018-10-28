class CreateGceRegions < ActiveRecord::Migration[5.2]
  def change
    create_table :gce_regions do |t|
      t.string :name
      t.string :address
      t.text :description
      t.string :default_zones
      t.boolean :is_active, :default => true

      t.timestamps
    end
  end
end
