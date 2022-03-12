class Contract < ApplicationRecord
  # das sind neuen Associations, contract hat jetzt zwei user_ids, als asker und als receiver. optional: true braucht man auch
  belongs_to :asker, class_name: "User", optional: true # foreign_key: :asker_id
  belongs_to :receiver, class_name: "User", optional: true # foreign_key: :receiver_id
  has_one :chatroom, dependent: :destroy
  enum status: { pending: 0, signed: 1, declined: 2, fullfilled: 3 }

  after_create :create_chatroom

  private

  def create_chatroom
    Chatroom.create(name: "Chat: #{asker.nickname} & #{receiver.nickname}", contract: self) # <= same as self.id, we assoicate a chatroom with a contract
  end
end
