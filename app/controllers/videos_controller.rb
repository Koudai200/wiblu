class VideosController < ApplicationController
    before_action :set_video, only: [:show, :edit, :update, :destroy]
    before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
  
    def new
      @video = Video.new
    end
  
    def create
      @video = Video.new(
        video_params
        )
      if @video.save
        flash[:notice] = "投稿しました"
        redirect_to("/videos/#{@video.id}")
      else
        render("videos/new")
      end
    end
  
    def index
      @videos = Video.all.order(created_at: :desc)
    end
  
    def show
      @video = Video.find_by(id: params[:id])
      @user = User.find_by(id: @video.user_id)
      @likes_count = Like.where(movie_id: @video).count
      if @apply.nil?
        @apply = Apply.new
      else
        @apply = Apply.find_by(video_id: @video.id)
      end
    end
  
    def edit
        @video = Video.find_by(id: params[:id])
    end
    
    def update
      if @video.update(video_params)
        flash[:notice] = "更新しました"
        redirect_to("/videos/#{@video.id}")
      else
        render("videos/edit")
      end
    end  
  
    def destroy
      @video.destroy
      flash[:notice] = "投稿を削除しました"
      redirect_to("/videos")
    end
  
    def set_video
      @video = Video.find_by(id: params[:id])
    end
  
    def video_params
      params.require(:video).permit(:body, :video, :content).merge(user_id: @current_user.id)
    end
  
    def ensure_correct_user
      @video = Video.find_by(id: params[:id])
      if @video.user_id != @current_user.id
        flash[:notice] = "権限がありません"
        redirect_to("/videos/index")
      end
    end
end
