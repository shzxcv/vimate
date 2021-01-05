class User < ApplicationRecord
  has_many :authentications, dependent: :destroy
  has_many :user_lessons, dependent: :destroy
  has_many :lessons, through: :user_lessons

  accepts_nested_attributes_for :authentications
  authenticates_with_sorcery!

  mount_uploader :avatar, AvatarUploader

  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, length: { minimum: 8 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  enum role: { general: 0, admin: 1}

  def to_param
    name
  end

  def chart_lists
    lessons.group(:id).select('category, name, count(user_lessons.time) as time_count, sum(user_lessons.time) as time_sum, count(user_lessons.answer_rate) as answer_rate_count, sum(user_lessons.answer_rate) as answer_rate_sum, count(user_lessons.id) as lesson_count').map { |x| [x.category + x.name, (x.time_sum.to_f / x.time_count.to_f).round, (x.answer_rate_sum.to_f / x.answer_rate_count.to_f).round, x.lesson_count] }
  end
end
