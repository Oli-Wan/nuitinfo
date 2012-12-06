class AddItemParentRelationship < ActiveRecord::Migration
  def change
    change_table :items do |t|
      t.references :parent
    end
  end
end
