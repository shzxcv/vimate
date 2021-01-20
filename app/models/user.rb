class User < ApplicationRecord
  has_many :authentications, dependent: :destroy
  has_many :user_lessons, dependent: :destroy
  has_many :lessons, through: :user_lessons

  accepts_nested_attributes_for :authentications
  authenticates_with_sorcery!

  mount_uploader :avatar, AvatarUploader

  validates :name, presence: true
  validates :email, uniqueness: true, presence: true, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i}
  validates_acceptance_of :agreement, presence: true, on: :create

  validates :password, length: { minimum: 8 }, if: -> { new_record? || changes[:crypted_password] }
  #半角英小文字大文字数字をそれぞれ1種類以上含む8文字以上100文字以下
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)[a-zA-Z\d]{8,100}+\z/ }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :reset_password_token, uniqueness: true, allow_nil: true

  enum role: { general: 0, admin: 1}

  def end_lessons
    lessons.group(:id)
  end

  def end_lessons_count(lesson)
    lessons.find_end_lessons(lesson).count
  end

  def user_average(lesson, avg)
    lessons.find_end_lessons(lesson).average(avg).to_f.round(0)
  end

  def user_month(lesson, avg)
    lessons.find_end_lessons(lesson).find_month_lessnos.group('date(user_lessons.created_at)').average("user_lessons.#{avg}").map { |k, v| [k.strftime('%m/%d'), v.to_f.round(0)]}.to_h
  end

  def user_level
    sum_point = lessons.sum(:point)
    level_list = {hiyokko: 10, nitouhei: 20, ittouhei: 30, joutouhei: 40, heityou: 60, gotyou: 80, gunsou: 100, soutyou: 120, juni: 170, syoui: 220, tyuui: 270, taii: 320, syousa: 520, tyuusa: 720, taisa: 920, syousyou: 1420, tyuusyou: 1920, taisyou: 0}.to_a
    return [:taisyou, nil, nil, sum_point] if sum_point >= 1920
    user_level = level_list.each { |level, point| if sum_point < point ; break [level, point] ; end}
    before_level_point = level_list[level_list.index(user_level) - 1][1]
    user_level[1] -= before_level_point
    current_point = sum_point - before_level_point
    #[階級, レベルアップに必要なポイント, 現在のポイント, 合計ポイント]
    return user_level.push(current_point, sum_point)
  end
end
