class Lesson < ApplicationRecord
  has_many :commands, dependent: :destroy
  has_many :user_lessons, dependent: :destroy
  has_many :users, through: :user_lessons

  validates :name, presence: true, uniqueness: { scope: :category }
  validates :category, presence: true
  validates :url, presence: true, uniqueness: true

  enum category: { Vim: 0, Vimrc: 1, Option: 2 }

  scope :find_end_lessons, -> (lesson) { where('lesson_id = ?', lesson.id) }
  scope :find_month_lessnos, -> { where(user_lessons: {created_at: Time.now.ago(1.month)..Time.now}) }

  def to_param
    url
  end
end
