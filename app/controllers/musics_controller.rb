class MusicsController < ApplicationController
  before_action :authenticate_user
  before_action :set_music, only: [:show, :edit, :update, :destroy]
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}

  
  def new
    @music = Music.new
  end

  def create
    @music = Music.new(
      music_params
      )
    if @music.save
      flash[:notice] = "投稿しました"
      redirect_to("/musics/#{@music.id}")
    else
      render("musics/new")
    end
  end

  def index
    @musics = Music.all.order(created_at: :desc)
  end

  def show
    @music = Music.find_by(id: params[:id])
    @user = User.find_by(id: @music.user_id)
    @likes_count = Like.where(music_id: @music).count
    if @apply.nil?
      @apply = Apply.new
    else
<<<<<<< HEAD
      @apply = Apply.find_by(music_id: @music.id)
=======
      @apply = Apply.find_by(movie_id: @movie.id)
>>>>>>> origin/main
    end
  end

  def edit
  end

  def update
    if @music.update(music_params)
      flash[:notice] = "更新しました"
      redirect_to("/musics/#{@music.id}")
    else
      render("musics/edit")
    end
  end

  def destroy
    @music.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/musics")
  end

    def set_music
      @music = Music.find_by(id: params[:id])
    end

    def music_params
      params.require(:music).permit(:file, :body, :content).merge(user_id: @current_user.id)
    end

    def authenticate_user
      if @current_user == nil
          flash[:notice] = "ログインが必要です"
          redirect_to("/")
      end
    end

    def ensure_correct_user
      @music = Music.find_by(id: params[:id])
      if @music.user_id != @current_user.id
        flash[:notice] = "権限がありません"
        redirect_to("/musics/index")
      end
    end

end
