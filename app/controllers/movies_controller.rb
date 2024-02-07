class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(
      movie_params
      )
    if @movie.save
      flash[:notice] = "投稿しました"
      redirect_to("/movies/#{@movie.id}")
    else
      render("movies/new")
    end
  end

  def index
    @movies = Movie.all.order(created_at: :desc)
  end

  def show
    @movie = Movie.find_by(id: params[:id])
    @user = User.find_by(id: @movie.user_id)
    @likes_count = Like.where(movie_id: @movie).count
    if @apply.nil?
      @apply = Apply.new
    else
      @apply = Apply.find_by(movie_id: @movie.id)
    end
  end

  def edit
  end
  
  def update
    if @movie.update(movie_params)
      flash[:notice] = "更新しました"
      redirect_to("/movies/#{@movie.id}")
    else
      render("movies/edit")
    end
  end  

  def destroy
    @movie.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/movies")
  end

  def set_movie
    @movie = Movie.find_by(id: params[:id])
  end

  def movie_params
    params.require(:movie).permit(:body, :video, :content).merge(user_id: @current_user.id)
  end

  def ensure_correct_user
    @movie = Movie.find_by(id: params[:id])
    if @movie.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/movies/index")
    end
  end
end