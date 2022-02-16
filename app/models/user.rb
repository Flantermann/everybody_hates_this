class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :issues, dependent: :destroy
  has_one_attached :photo
  enum languages: { german: 0, englisch: 1, both: 2}

  validates :email, :first_name, :last_name, :nickname, :age, :address, :languages, presence: true
  validates :email, presence: true, uniqueness: true, format: {
    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  }
end
