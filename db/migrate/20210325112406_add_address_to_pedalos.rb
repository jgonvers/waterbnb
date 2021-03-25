class AddAddressToPedalos < ActiveRecord::Migration[6.0]
  def change
    add_column :pedalos, :Address, :string
  end
end
