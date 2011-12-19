class CreateDecisions < ActiveRecord::Migration
  def change
    create_table :decisions do |t|
      t.string :subject
      t.text :description

      t.timestamps
    end
  end
end
