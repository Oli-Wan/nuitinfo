class AddPublishedToItem < ActiveRecord::Migration
  def change
    change_table :items do |t|
      t.boolean :published
    end
  end
end
