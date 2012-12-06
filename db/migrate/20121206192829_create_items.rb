class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :content
      t.date :date
      t.string :content_type

      t.timestamps
    end
  end
end
