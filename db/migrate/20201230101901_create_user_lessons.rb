class CreateUserLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :user_lessons do |t|
      t.references :user, null: false, foreign_key: true
      t.references :lesson, null: false, foreign_key: true
      t.integer :time, null: false
      t.integer :answer_rate, null: false

      t.timestamps
    end
  end
end
