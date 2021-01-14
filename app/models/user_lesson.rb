class UserLesson < ApplicationRecord
  belongs_to :user
  belongs_to :lesson

  validates :time, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :answer_rate, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :find_all_end_lessons, -> (lesson) { where('lesson_id = ?', lesson.id) }

  def self.all_average(lesson, avg)
    find_all_end_lessons(lesson).average(avg).to_f.round(0)
  end
end
