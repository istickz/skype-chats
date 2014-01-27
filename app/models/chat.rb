class Chat < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  mount_uploader :image, ImageUploader
  belongs_to :category
  belongs_to :user
  def should_generate_new_friendly_id?
    new_record?
  end


end
