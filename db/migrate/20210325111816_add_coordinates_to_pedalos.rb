class AddCoordinatesToPedalos < ActiveRecord::Migration[6.0]
  def change
    add_column :pedalos, :latitude, :float
    add_column :pedalos, :longitude, :float
  end
end
