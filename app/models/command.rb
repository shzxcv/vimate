class Command < ApplicationRecord
  belongs_to :lesson

  validates :answer_key, presence: true
  validates :question, presence: true
end
