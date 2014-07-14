class RenameMapsOwnerColumn < ActiveRecord::Migration
  def change
    rename_column :maps, :owner_id, :user_id
  end
end
