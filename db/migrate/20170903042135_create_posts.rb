class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.text :content
      t.integer :user_id
      t.string :category
      t.string :title
    end
  end
end
