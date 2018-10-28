class CreateGceZones < ActiveRecord::Migration[5.2]
  def change
    create_table :gce_zones do |t|
      t.string :name
      t.boolean :is_active, :default => true
      t.references :gce_region, foreign_key: true
      t.timestamps
    end

    #add_index :zones, :gce_region_id

  end
end
