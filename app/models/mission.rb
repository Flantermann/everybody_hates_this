class Mission < ApplicationRecord
  belongs_to :user
  belongs_to :contract, optional: true
  has_many :milestones

  enum category: { misc: 0, body_mind: 1, administration: 2, relationship: 3, work: 4, household: 5 }
  enum timeframe: { seven_d: 0, two_w: 1, four_w: 2, six_w: 3, nW: 4 }
  enum prefered_buddy_location: { near: 0, anywhere: 1 }

  validates :description, presence: true, length: { minimum: 50 }
  validates :title, :category, :timeframe, :prefered_buddy_location, presence: true
  validates :prefered_buddy_age_start, presence: true, numericality: { only_integer: true, greater_than: 11 }
  validates :prefered_buddy_age_end, presence: true, numericality: { only_integer: true, greater_than: :prefered_buddy_age_start }
end
