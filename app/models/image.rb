class Image < ApplicationRecord
  mount_uploader :ctype, ImageUploader

  validates :image_name, {presence: true}
  validates :user_id, {presence: true}

  has_many :likes

  belongs_to :user

  def self.search(keyword)
    where(["image_name like? OR ctype like?", "%#{keyword}%", "%#{keyword}%"])
  end

  def user
    return User.find_by(id: self.user_id)
  end
  
end
