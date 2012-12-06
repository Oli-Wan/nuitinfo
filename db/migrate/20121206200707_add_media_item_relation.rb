class AddMediaItemRelation < ActiveRecord::Migration
  def change
    change_table :media do |t|
      t.references :item
    end
  end
end
