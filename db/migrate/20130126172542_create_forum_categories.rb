class CreateForumCategories < ActiveRecord::Migration
  def change
    create_table :forum_categories do |t|

      t.timestamps
    end
  end
end
