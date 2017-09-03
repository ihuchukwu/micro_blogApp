class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.text   :portfolio
      t.string :about
      t.string :quest_book
    end
  end
end
