class CreateLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.string :name, null: false
      t.string :description
      t.integer :category, null: false, default: 0
      t.string :url, null: false, unique: true

      t.timestamps
    end

    add_index :lessons, [:name, :category], unique: true
  end
end
