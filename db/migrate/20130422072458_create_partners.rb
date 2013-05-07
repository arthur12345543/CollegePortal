class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.has_attached_file :picture
      t.string  :name
      t.text    :text
      t.timestamps
    end
    change_table:roles do |t|
      t.boolean :can_edit_partners, :default => false
    end
  end
end
