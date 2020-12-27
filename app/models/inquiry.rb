class Inquiry < ApplicationRecord
  validates :category, presence: true
  validates :body, presence: true

  enum category: { bug: 0, request: 1, others: 2 }
end
