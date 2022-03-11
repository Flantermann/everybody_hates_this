class Chatroom < ApplicationRecord
  has_many :messages
  belongs_to :sender_one, class_name: :User, optional: true
  belongs_to :sender_two, class_name: :User, optional: true
  belongs_to :mission

  validates :name, uniqueness: true
  scope :public_rooms, -> { where(is_private: false) }

end
