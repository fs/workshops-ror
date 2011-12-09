class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :body
      t.integer :user_id
      t.integer :decision_id

      t.timestamps
    end
  end
end
