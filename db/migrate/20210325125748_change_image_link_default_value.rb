class ChangeImageLinkDefaultValue < ActiveRecord::Migration[6.0]
  def change
    change_column :pedalos, :image_link, :string, default: "\"/pedalos_images/default.png"
  end
end
