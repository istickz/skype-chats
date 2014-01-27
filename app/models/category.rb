class Category < ActiveRecord::Base
  has_many :chats
  extend FriendlyId
  friendly_id :alias
end
