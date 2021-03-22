class User < ApplicationRecord
  has_many :pedalos, dependent: :destroy, :foreign_key => "owner_id"
end
