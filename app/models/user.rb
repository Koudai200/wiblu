class User < ApplicationRecord
    has_secure_password

    has_many :entries, dependent: :destroy
    has_many :messages, dependent: :destroy
    has_many :likes
    has_many :posts, dependent: :destroy
    has_many :musics, dependent: :destroy
    has_many :movies, dependent: :destroy
    has_many :images, dependent: :destroy

    validates_acceptance_of :agreement, allow_nil: false, on: :create
    validates :name, {presence: true}
    validates :email,{presence: true, uniqueness: true}

    def self.search(keyword)
      where(["name like?", "%#{keyword}%"])
    end

    def posts
      return Post.where(user_id: self.id)
    end

    def images
      return Image.where(user_id: self.id)
    end

    def movies
      return Movie.where(user_id: self.id)
    end

    def musics
      return Music.where(user_id: self.id)
    end

end
