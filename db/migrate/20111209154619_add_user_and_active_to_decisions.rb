class AddUserAndActiveToDecisions < ActiveRecord::Migration
  def change
    add_column :decisions, :user_id, :integer
    add_column :decisions, :active, :boolean, default: false
  end
end
