class Lesson < ApplicationRecord
  has_many :commands, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :category }
  validates :category, presence: true
  validates :url, presence: true, uniqueness: true

  enum category: { Vim: 0, Vimrc: 1, Option: 2 }

  def to_param
    url
  end
end
