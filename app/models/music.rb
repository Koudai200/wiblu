class Music < ApplicationRecord
    mount_uploader :file, AudiofileUploader

    validates :body, {presence: true}

    belongs_to :user

    has_many :likes

    has_many :applies, dependent: :destroy
    has_many :users, through: :requests

    def self.search(keyword)
      where(["body like?", "%#{keyword}%"])
    end
    
    def user
      return User.find_by(id: self.user_id)
    end

end
