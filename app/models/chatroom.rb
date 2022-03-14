class Chatroom < ApplicationRecord
  has_many :messages
  has_one :contract
  belongs_to :asker_id, class_name: :User, optional: true
  belongs_to :receiver_id, class_name: :User, optional: true

  belongs_to :contract

  validates :name, uniqueness: true
  scope :public_rooms, -> { where(is_private: false) }

end
