class AddPublishedToItem < ActiveRecord::Migration
  def up
    add_column :items, :published, :boolean, default: true
  end

  def down
  	remove_column :items, :published
  end
end
