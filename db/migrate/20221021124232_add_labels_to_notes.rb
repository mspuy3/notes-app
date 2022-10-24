class AddLabelsToNotes < ActiveRecord::Migration[6.1]
  def change
    add_reference :notes, :label, null: false, foreign_key: true
  end
end
