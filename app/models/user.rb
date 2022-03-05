class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :missions, dependent: :destroy
  has_one_attached :photo
  # a contract now stores two user_ids. so a user has many contracts in different roles

  # this doesn't work, I don't know why
  has_many :contracts_as_asker, class_name: "Contract", foreign_key: :asker_id
  has_many :contracts_as_receiver, class_name: "Contract", foreign_key: :receiver_id

  has_many :chatrooms_as_sender_one, class_name: "Chatroom", foreign_key: :sender_one_id
  has_many :chatrooms_as_sender_two, class_name: "Chatroom", foreign_key: :sender_two_id

  validates :first_name, :last_name, :address, presence: true
  validates :email, presence: true, uniqueness: true, format: {
    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  }
  validates :nickname, presence: true, uniqueness: true
  validates :about_me, presence: true, length: { minimum: 50 }
  validates :age, presence: true, numericality: { only_integer: true, in: 12..103 }
end
