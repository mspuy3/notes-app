class AddUserIdToLabels < ActiveRecord::Migration[6.1]
  def change
    add_column :labels, :user_id, :string
    add_index :labels, :user_id
  end
end
