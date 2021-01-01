class UserLesson < ApplicationRecord
  belongs_to :user
  belongs_to :lesson

  validates :time, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :answer_rate, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
