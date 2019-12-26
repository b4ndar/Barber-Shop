class RenameUserIdIdToUserId < ActiveRecord::Migration[6.0]
  def change
    rename_column :appointments, :user_id_id, :user_id
  end
end
