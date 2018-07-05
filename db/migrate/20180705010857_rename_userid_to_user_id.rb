class RenameUseridToUserId < ActiveRecord::Migration[5.2]
  def change
    rename_column :tasks, :userid, :user_id
  end
end
