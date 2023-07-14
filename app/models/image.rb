class Image < ApplicationRecord
  mount_uploader :ctype, ImageUploader

  validates :image_name, {presence: true}
  validates :user_id, {presence: true}

  has_many :likes

  belongs_to :user

  has_many :applies, dependent: :destroy
  has_many :users, through: :requests

  def self.search(keyword)
    where(["image_name like? OR ctype like?", "%#{keyword}%", "%#{keyword}%"])
  end

  def user
    return User.find_by(id: self.user_id)
  end
  
end
