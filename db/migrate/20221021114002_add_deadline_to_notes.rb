class AddDeadlineToNotes < ActiveRecord::Migration[6.1]
  def change
    add_column :notes, :deadline, :datetime
  end
end
