class Like < ApplicationRecord
    belongs_to :user
    belongs_to :post, optional: true
    belongs_to :music, optional: true
    belongs_to :image, optional: true
    belongs_to :movie, optional: true
  
    validates :user_id, presence: true
    validates :post_id, uniqueness: { scope: [:music_id, :image_id, :movie_id], allow_nil: true }
    validates :music_id, uniqueness: { scope: [:post_id, :image_id, :movie_id], allow_nil: true }
    validates :image_id, uniqueness: { scope: [:post_id, :music_id, :movie_id], allow_nil: true }
    validates :movie_id, uniqueness: { scope: [:post_id, :music_id, :image_id], allow_nil: true }
  end
  