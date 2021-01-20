require 'rails_helper'

RSpec.describe UserLesson, type: :model do
  let(:user) { create(:user) }
  let(:lesson) { create(:lesson) }

  context 'マイページグラフ' do
    it 'ユーザ全体の平均正答率が取得できること' do
      other_user = create(:user)
      #60
      create_list(:user_lesson, 10, user: user, lesson: lesson)
      #66.5
      create_list(:user_lesson, 10, :all_user_answer_rate, user: other_user, lesson: lesson)
      #((60 + 66.5) / 2) = 63.25 ≒ 63
      expect(UserLesson.all_average(lesson, :answer_rate)).to eq(63)
    end

    it 'ユーザ全体の平均タイムが取得できること' do
      other_user = create(:user)
      #100
      create_list(:user_lesson, 10, user: user, lesson: lesson)
      #46.5
      create_list(:user_lesson, 10, :all_user_time, user: other_user, lesson: lesson)
      #((100 + 46.5) / 2) = 73.25 ≒ 73
      expect(UserLesson.all_average(lesson, :time)).to eq(73)
    end
  end
end
