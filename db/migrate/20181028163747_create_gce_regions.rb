class CreateGceRegions < ActiveRecord::Migration[5.2]
  def change
    create_table :gce_regions do |t|
      t.string :name
      t.string :address
      t.text :description
      t.bool :is_active

      t.timestamps
    end
  end
end
