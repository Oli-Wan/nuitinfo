class AddItemLocalisation < ActiveRecord::Migration
  def change
    change_table :items do |t|
      t.string :longitude
      t.string :latitude
      t.string :altitude
    end
  end
end
