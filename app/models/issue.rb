class Issue < ApplicationRecord
  belongs_to :user
  belongs_to :contract
  # has_many :milestones

  enum category: { body_mind: 0, health: 1, administration: 2, relationship: 3, work: 4, household: 5 }
  enum timeframe: { seven_d: 0, two_w: 1, four_w: 2, six_w: 3, nW: 4 }
  enum prefered_buddy_age: { group_1: 0, group_2: 1, group_3: 2, group_4: 3, group_5: 4 }
  enum prefered_buddy_location: { near: 0, far: 1, too_far: 2 }

  validates :description, presence: true, length: { minimum: 50 }
  validates :title, :description, :category, :timeframe, :prefered_buddy_age, :prefered_buddy_location, presence: true
end
