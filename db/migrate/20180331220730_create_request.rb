class CreateRequest < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.references :user, foreign_key: true
      t.string :subject
      t.text :detail
    end
  end
end
