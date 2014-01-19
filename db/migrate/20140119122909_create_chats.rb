class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.string :title
      t.string :url
      t.integer :category_id

      t.timestamps
    end
  end
end
