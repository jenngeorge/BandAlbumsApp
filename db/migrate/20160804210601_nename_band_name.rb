class NenameBandName < ActiveRecord::Migration
  def change
    rename_column :bands, :text, :name
  end
end
