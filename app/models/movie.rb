class Movie < ApplicationRecord
    belongs_to :user
    mount_uploader :video, VideoUploader
    
    validates :body, {presence: true}

    has_many :likes

    has_many :applies, dependent: :destroy
    has_many :users, through: :requests

    def user_belonging?(user)
      users.include?(user)
    end

    def self.search(keyword)
      where(["body like?", "%#{keyword}%"])
    end

    def user
      return User.find_by(id: self.user_id)
    end
end
