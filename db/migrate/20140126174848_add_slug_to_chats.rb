class AddSlugToChats < ActiveRecord::Migration
  def change
    add_column :chats, :slug, :string
    add_index :chats, :slug
  end
end
