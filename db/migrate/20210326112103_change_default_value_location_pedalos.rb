class ChangeDefaultValueLocationPedalos < ActiveRecord::Migration[6.0]
  def change
    change_column :pedalos, :location, :string, default: "Vaud"
  end
end
