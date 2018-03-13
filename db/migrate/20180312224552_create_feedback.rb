class CreateFeedback < ActiveRecord::Migration[5.1]
  def change
    create_table :feedbacks do |t|
      t.string :title
      t.text :body
      t.references :user, foreign_key: true
      t.integer :recipient_id
    end
  end
end
