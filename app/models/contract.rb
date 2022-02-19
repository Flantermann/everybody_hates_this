class Contract < ApplicationRecord
  has_many :missions
  enum status: { pending: 0, signed: 1, fullfilled: 2 }
end
