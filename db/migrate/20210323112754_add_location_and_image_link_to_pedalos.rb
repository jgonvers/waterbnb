class AddLocationAndImageLinkToPedalos < ActiveRecord::Migration[6.0]
  def change
    add_column :pedalos, :location, :string, default: 'no location'
    add_column :pedalos, :image_link, :string, default: '"/assets/images/pedalos_images/default.png'
  
  end
end
