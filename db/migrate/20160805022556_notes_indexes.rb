class NotesIndexes < ActiveRecord::Migration
  def change
    add_index :notes, :author_id
    add_index :notes, :track_id
  end
end
