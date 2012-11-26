class NewsNameTextAutorAdding < ActiveRecord::Migration
  def up
    change_table:news do |t|
      t.string  :title
      t.text    :text
    end
  end
  def down
  end
end
