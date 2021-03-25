class ChangeAddressNameToPedalos < ActiveRecord::Migration[6.0]
  def change
    rename_column :pedalos, :Address, :address
  end
end
