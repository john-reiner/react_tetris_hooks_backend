class CreateScores < ActiveRecord::Migration[6.0]
  def change
    create_table :scores do |t|
      t.integer :user_id
      t.integer :score
      t.integer :rows
      t.integer :level

      t.timestamps
    end
  end
end
