class Contract < ApplicationRecord
  # das sind neuen Associations, contract hat jetzt zwei user_ids, als asker und als receiver. optional: true braucht man auch
  belongs_to :asker, class_name: :User, optional: true
  belongs_to :receiver, class_name: :User, optional: true
  # geht das hier mit dem "mission through users?"" braucht man das überhaupt?

  # has_many :asker_missions, through: :asker
  # has_many :receiver_missions, through: :receiver
  # wenn man das oben benutzt, kann man die missions nur einzeln aufrufen
  # Man müsste das aber zusammenführen können, zu allen missions, die ein contract hat
  enum status: { pending: 0, signed: 1, fullfilled: 2 }
end
