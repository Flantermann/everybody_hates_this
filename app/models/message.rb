# class Message < ApplicationRecord
#   belongs_to :chatroom
#   belongs_to :user
# end

class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user
end
