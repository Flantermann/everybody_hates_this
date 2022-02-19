class Milestone < ApplicationRecord
  belongs_to :mission
  enum status: { in_progress: 0, done: 1 }
  validates :description, presence: true, length: { minimum: 10 }
end
