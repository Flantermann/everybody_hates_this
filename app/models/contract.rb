class Contract < ApplicationRecord
  # das sind neuen Associations, contract hat jetzt zwei user_ids, als asker und als receiver. optional: true braucht man auch
  belongs_to :asker, class_name: "User", optional: true # foreign_key: :asker_id
  belongs_to :receiver, class_name: "User", optional: true # foreign_key: :receiver_id

  enum status: { pending: 0, signed: 1, fullfilled: 2 }
end
