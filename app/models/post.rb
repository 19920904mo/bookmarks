class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  
  validates :title, {presence:true,length:{maximum:50}}
  validates :url, {presence:true}
  validates :content, {presence:true,length:{maximum:2000}}
  validates :user_id, {presence:true}
end
