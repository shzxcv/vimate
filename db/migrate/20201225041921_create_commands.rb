class CreateCommands < ActiveRecord::Migration[6.0]
  def change
    create_table :commands do |t|
      t.references :lesson, null: false, foreign_key: true
      t.string :answer_key, null: false
      t.string :question, null: false

      t.timestamps
    end
  end
end
