class AddMediaUserRelationship < ActiveRecord::Migration
  def change
    change_table :media do |t|
      t.reference :author
    end
  end
end
