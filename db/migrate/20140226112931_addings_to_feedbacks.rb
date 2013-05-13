class AddingsToFeedbacks < ActiveRecord::Migration
  def up
  	change_table:roles do |t|
      t.boolean :can_admin_feedbacks, :default => false
    end
    change_table:feedbacks do |t|
      t.boolean :served, :default => false
    end
    @a=Role.find(2)
    @a.can_admin_feedbacks=true
    @a.save
  end

  def down
  end
end
