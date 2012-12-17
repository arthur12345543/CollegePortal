class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.text :title

      t.timestamps
    end
  end
end
