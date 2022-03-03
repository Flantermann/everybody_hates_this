class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :missions, dependent: :destroy
  has_one_attached :photo
  has_many :contracts_as_asker, class_name: "Contracts", foreign_key: :asker_id
  has_many :contracts_as_receiver, class_name: "Contracts", foreign_key: :receiver_id

  validates :first_name, :last_name, :address, presence: true
  validates :email, presence: true, uniqueness: true, format: {
    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  }
  validates :nickname, presence: true, uniqueness: true
  validates :about_me, presence: true, length: { minimum: 50 }
  validates :age, presence: true, numericality: { only_integer: true, in: 12..103 }
end
