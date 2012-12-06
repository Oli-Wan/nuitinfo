class AddItemUserRelationship < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.references :author
    end
  end
end
