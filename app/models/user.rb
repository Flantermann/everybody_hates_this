class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :missions, dependent: :destroy
  has_one_attached :photo

  validates :first_name, :last_name, :address, presence: true
  validates :email, presence: true, uniqueness: true, format: {
    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  }
  validates :nickname, presence: true, uniqueness: true
  validates :about_me, presence: true, length: { minimum: 50 }
  validates :age, presence: true, numericality: { only_integer: true, in: 12..103 }
end
