class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.text :description
      t.integer :album_id
      t.has_attached_file :picture

      t.timestamps
    end
  end
end
