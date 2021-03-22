class ChangeForeignKeyForPedalo < ActiveRecord::Migration[6.0]
  def change
    rename_column :pedalos, :user_id, :owner_id
  end
end
