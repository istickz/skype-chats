# == Schema Information
#
# Table name: chats
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  url         :string(255)
#  category_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#  user_id     :integer
#  image       :string(255)
#  description :string(255)
#  slug        :string(255)
#

class Chat < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  mount_uploader :image, ImageUploader
  belongs_to :category
  belongs_to :user
  validates :title, :description, :image, presence: true

  def should_generate_new_friendly_id?
    new_record?
  end


end
