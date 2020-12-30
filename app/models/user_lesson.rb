class UserLesson < ApplicationRecord
  belongs_to :user
  belongs_to :lesson

  validates :time, presence: true
  validates :answer_rate, presence: true
end
