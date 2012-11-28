class PolimorfUser < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.references :character, :polymorphic => true
    end
  end

  def down
  end
end
