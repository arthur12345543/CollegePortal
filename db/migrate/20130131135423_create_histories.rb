class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
	t.text :title
	t.text :text
      t.timestamps
    end
  end
end
