class AddItemUserRelationship < ActiveRecord::Migration
  def change
    change_table :items do |t|
      t.references :author
    end
  end
end
