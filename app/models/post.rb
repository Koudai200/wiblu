class Post < ApplicationRecord
    validates :content, {presence: true, length: {maximum: 600}}
    validates :user_id, {presence: true}
    
    belongs_to :user
    has_many :likes

    def self.search(keyword)
      where("body LIKE :keyword OR title LIKE :keyword OR content LIKE :keyword", keyword: "%#{keyword}%")
    end

    def user
      return User.find_by(id: self.user_id)
    end

end
