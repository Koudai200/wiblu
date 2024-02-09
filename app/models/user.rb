class User < ApplicationRecord
<<<<<<< HEAD
  authenticates_with_sorcery!
  has_secure_password
=======
    authenticates_with_sorcery!
    has_secure_password
>>>>>>> origin/main

    has_many :entries, dependent: :destroy
    has_many :messages, dependent: :destroy
    has_many :likes
<<<<<<< HEAD

    has_many :applies, dependent: :destroy

=======
    has_many :applies, dependent: :destroy
>>>>>>> origin/main
    has_many :posts, dependent: :destroy
    has_many :musics, dependent: :destroy
    has_many :movies, dependent: :destroy
    has_many :images, dependent: :destroy
    has_many :videos, dependent: :destroy

<<<<<<< HEAD

=======
>>>>>>> origin/main
    validates_acceptance_of :agreement, allow_nil: false, on: :create
    validates :name, {presence: true}
    validates :email,{presence: true, uniqueness: true}
    validates :agreement, acceptance: true
    validates :reset_password_token, uniqueness: true, allow_nil: true

    def self.search(keyword)
      where(["name like?", "%#{keyword}%"])
    end
end
