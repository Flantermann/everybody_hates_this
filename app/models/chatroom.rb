# class Chatroom < ApplicationRecord
#   has_many :messages
# end

class Chatroom < ApplicationRecord
  has_many :messages
  belongs_to :meeting
end
