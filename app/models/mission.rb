class Mission < ApplicationRecord
  scope :filter_by_category, -> (category) { where category: category}
  scope :filter_by_timeframe, -> (timeframe) { where timeframe: timeframe}

  belongs_to :user
  # das auskommentiert, weil jetzt contract to user belongs
  # belongs_to :contract, optional: true
  has_many :milestones

  enum category: { miscellaneous: 0, body_and_mind: 1, administrative_tasks: 2, relationships: 3, work_life: 4, household: 5 }
  enum timeframe: { Three_to_seven_days: 0, one_to_two_weeks: 1, two_to_four_weeks: 2, four_to_six_weeks: 3, more_than_six_weeks: 4 }
  enum prefered_buddy_location: { in_my_area: 0, can_be_anywhere: 1 }

  validates :description, presence: true, length: { minimum: 50 }
  validates :title, :category, :timeframe, :prefered_buddy_location, presence: true
  validates :prefered_buddy_age_start, presence: true, numericality: { only_integer: true, greater_than: 11 }
  validates :prefered_buddy_age_end, presence: true, numericality: { only_integer: true, greater_than: :prefered_buddy_age_start }

end
