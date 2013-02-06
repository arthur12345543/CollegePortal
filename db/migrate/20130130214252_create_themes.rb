class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.text :title
      t.integer :section_id
      t.timestamps
    end
  end
end
