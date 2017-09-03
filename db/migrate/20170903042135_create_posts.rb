class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :content
      t.string :user_id
      t.string :category
      t.string :title
    end
  end
end
