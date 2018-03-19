class CreateQuestion < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :body
      t.boolean :correct
    end
  end
end
