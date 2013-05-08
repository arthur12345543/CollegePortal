class AddingsToFeedbacks < ActiveRecord::Migration
  def up
  	change_table:roles do |t|
      t.boolean :can_admin_feedbacks, :default => false
    end
    change_table:feedbacks do |t|
      t.boolean :served, :default => false
    end
    Role.find(2).update_attributes(:can_admin_feedbacks=>true)
  end

  def down
  end
end
