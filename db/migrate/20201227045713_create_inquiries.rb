class CreateInquiries < ActiveRecord::Migration[6.0]
  def change
    create_table :inquiries do |t|
      t.string :email
      t.string :name
      t.integer :category, null: false, default: 0
      t.text :body, null: false

      t.timestamps
    end
  end
end
