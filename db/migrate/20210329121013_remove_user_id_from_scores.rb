class RemoveUserIdFromScores < ActiveRecord::Migration[6.0]
  def change
    remove_column :scores, :user_id, :integer
  end
end
