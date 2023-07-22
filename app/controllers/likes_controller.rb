class LikesController < ApplicationController
  before_action :authenticate_user

  def create
    @like = Like.new(
      user_id: @current_user.id,
      post_id: params[:post_id]
    )
    @like.save
    redirect_to("/posts/#{params[:post_id]}")
  end

  def music_create
    @like = Like.new(
      user_id: @current_user.id,
      music_id: params[:music_id]
    )
    @like.save
    redirect_to("/musics/#{params[:music_id]}")
  end

  def movie_create
    @like = Like.new(
      user_id: @current_user.id,
      movie_id: params[:movie_id]
    )
    @like.save
    redirect_to("/movies/#{params[:movie_id]}")
  end

  def image_create
    @like = Like.new(
      user_id: @current_user.id,
      image_id: params[:image_id]
    )
    @like.save
    redirect_to("/images/#{params[:image_id]}")
  end

  def video_create
    @like = Like.new(
      user_id: @current_user.id,
      video_id: params[:video_id]
    )
    @like.save
    redirect_to("/videos/#{params[:video_id]}")
  end

  def destroy
    @like = Like.find_by(
      user_id: @current_user.id,
      post_id: params[:post_id]
    )
    @like.destroy
    redirect_to("/posts/#{params[:post_id]}")
  end

  def music_destroy
    @like = Like.find_by(
      user_id: @current_user.id,
      music_id: params[:music_id]
    )
    @like.destroy
    redirect_to("/musics/#{params[:music_id]}")
  end

  def movie_destroy
    @like = Like.find_by(
      user_id: @current_user.id,
      movie_id: params[:movie_id]
    )
    @like.destroy
    redirect_to("/movies/#{params[:movie_id]}")
  end

  def image_destroy
    @like = Like.find_by(
      user_id: @current_user.id,
      image_id: params[:image_id]
    )
    @like.destroy
    redirect_to("/images/#{params[:image_id]}")
  end

  def video_destroy
    @like = Like.find_by(
      user_id: @current_user.id,
      video_id: params[:video_id]
    )
    @like.destroy
    redirect_to("/videos/#{params[:video_id]}")
  end
end
