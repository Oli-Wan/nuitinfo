class AddMediaUserRelationship < ActiveRecord::Migration
  def change
    change_table :media do |t|
      t.references :author
    end
  end
end
