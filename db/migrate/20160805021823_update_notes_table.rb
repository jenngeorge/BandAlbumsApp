class UpdateNotesTable < ActiveRecord::Migration
  def change
    add_column :notes, :comment, :text, null: false
    add_column :notes, :author_id, :integer, null: false
    add_column :notes, :track_id, :integer, null: false

  end
end
