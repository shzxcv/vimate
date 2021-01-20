require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  let(:lesson) { create(:lesson) }

  context 'メール正常系' do
    it 'ユーザー名、メールアドレス、パスワード、パスワード確認用、同意が含まれているとき' do
      expect(build(:user)).to be_valid
    end
  end
  context 'メール異常系' do
    it 'ユーザー名が存在しない' do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include('を入力してください')
    end
    it 'メールアドレスが存在しない' do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include('を入力してください')
    end
    it 'メールアドレスが一意でない' do
      user = create(:user, email: 'test@example.com')
      user = build(:user, email: 'test@example.com')
      user.valid?
      expect(user.errors[:email]).to include('はすでに存在します')
    end
    it 'メールアドレスのフォーマットが@マーク以前が存在しない' do
      user = build(:user, email: '@example.com')
      user.valid?
      expect(user.errors[:email]).to include('は不正な値です')
    end
    it 'メールアドレスのフォーマットが@マーク以降が存在しない' do
      user = build(:user, email: 'test@')
      user.valid?
      expect(user.errors[:email]).to include('は不正な値です')
    end
    it 'メールアドレスのフォーマットが@マーク以降がドメインではない' do
      user = build(:user, email: 'test@example')
      user.valid?
      expect(user.errors[:email]).to include('は不正な値です')
    end
    it 'パスワードが入力されていない' do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include('は8文字以上で入力してください')
    end
    it 'パスワード確認用が入力されていない' do
      user = build(:user, password_confirmation: nil)
      user.valid?
      expect(user.errors[:password_confirmation]).to include('を入力してください')
    end
    it 'パスワードが7文字以下' do
      user = build(:user, password: 'Passw0r')
      user.valid?
      expect(user.errors[:password]).to include('は8文字以上で入力してください')
    end
    it 'パスワードが英小文字のみ' do
      user = build(:user, password: 'password')
      user.valid?
      expect(user.errors[:password]).to include('は不正な値です')
    end
    it 'パスワードが英大文字のみ' do
      user = build(:user, password: 'PASSWORD')
      user.valid?
      expect(user.errors[:password]).to include('は不正な値です')
    end
    it 'パスワードが数字のみ' do
      user = build(:user, password: '12345678')
      user.valid?
      expect(user.errors[:password]).to include('は不正な値です')
    end
  end
  context 'マイページレベルアップ' do
    it '15Pのとき二等兵であること' do
      #[階級, レベルアップに必要なポイント, 現在のポイント, 合計ポイント]
      create_list(:user_lesson, 5, user: user, lesson: lesson)
      expect(user.user_level).to eq([:nitouhei, 10, 5, 15])
    end
    it '360Pのとき少佐であること' do
      create_list(:user_lesson, 120, user: user, lesson: lesson)
      expect(user.user_level).to eq([:syousa, 200, 40, 360])
    end
    it '1500Pのとき中将であること' do
      create_list(:user_lesson, 500, user: user, lesson: lesson)
      expect(user.user_level).to eq([:tyuusyou, 500, 80, 1500])
    end
    it '1950Pのとき大将であること' do
      create_list(:user_lesson, 650, user: user, lesson: lesson)
      expect(user.user_level).to eq([:taisyou, nil, nil, 1950])
    end
  end
  context 'マイページグラフ' do
    it '受講回数が取得できること' do
      create_list(:user_lesson, 10, user: user, lesson: lesson)
      expect(user.end_lessons_count(lesson)).to eq(10)
    end
    it 'ユーザの平均正答率が表示されること' do
      create_list(:user_lesson, 10, :answer_rate, user: user, lesson: lesson)
      #合計610/10 = 61
      expect(user.user_average(lesson, :answer_rate)).to eq(67)
    end
    it 'ユーザの日毎の平均正答率が表示されること' do
      create_list(:user_lesson, 10, :today_answer, user: user, lesson: lesson)
      create_list(:user_lesson, 10, :yesterday_answer, user: user, lesson: lesson)
      create_list(:user_lesson, 10, :two_days_ago_answer, user: user, lesson: lesson)
      expect(user.user_month(lesson, 'answer_rate')).to eq([["#{Time.current.ago(2.days).strftime('%m/%d')}", 56], ["#{Time.current.ago(1.days).strftime('%m/%d')}", 61], ["#{Time.current.strftime('%m/%d')}", 67]].to_h)
    end
    it 'ユーザの平均タイムが表示されること' do
      create_list(:user_lesson, 10, :time, user: user, lesson: lesson)
      #合計465/10 ≒ 47
      expect(user.user_average(lesson, :time)).to eq(47)
    end
    it 'ユーザの日毎の平均タイムが表示されること' do
      create_list(:user_lesson, 10, :today_time, user: user, lesson: lesson)
      create_list(:user_lesson, 10, :yesterday_time, user: user, lesson: lesson)
      create_list(:user_lesson, 10, :two_days_ago_time, user: user, lesson: lesson)
      expect(user.user_month(lesson, 'time')).to eq([["#{Time.current.ago(2.days).strftime('%m/%d')}", 36], ["#{Time.current.ago(1.days).strftime('%m/%d')}", 41], ["#{Time.current.strftime('%m/%d')}", 47]].to_h)
    end
  end
end
