class AppliesController < ApplicationController
    before_action :authenticate_user
    before_action :ensure_correct_user,
    {only: [:post_update, :music_update, :movie_update, :image_update,
            :post_destroy, :music_destroy, :movie_destroy, :image_destroy]}

    def post_create
        @apply = Apply.new(post_id: apply_params[:post_id])
        @post = Post.find_by(id: apply_params[:post_id])
        @apply.user_id = @current_user.id
        if @apply.save
          flash[:notice] = "申請が送信されました"
          flash[:success] = "申請が送信されました"
          redirect_to("/posts/#{@post.id}")
        else
          flash[:alert] = "申請に失敗しました"
          redirect_to("/posts/#{@post.id}")
        end
      end

    def movie_create
      @apply = Apply.new(movie_id: apply_params[:movie_id])
      @movie = Movie.find_by(id: apply_params[:movie_id])
      @apply.user_id = @current_user.id
      if @apply.save
        flash[:notice] = "申請が送信されました"
        flash[:success] = "申請が送信されました"
        redirect_to movie_path(id: @movie.id)
      else
        flash[:alert] = "申請に失敗しました"
        redirect_to movie_path(id: @movie.id)
      end
    end

    def image_create
        @apply = Apply.new(image_id: apply_params[:image_id])
        @image = Image.find_by(id: apply_params[:image_id])
        @apply.user_id = @current_user.id
        if @apply.save
          flash[:notice] = "申請が送信されました"
          flash[:success] = "申請が送信されました"
          redirect_to image_path(id: @image.id)
        else
          flash[:alert] = "申請に失敗しました"
          redirect_to image_path(id: @image.id)
        end
    end
      
  
    def music_create
        @apply = Apply.new(music_id: apply_params[:music_id])
        @music = Music.find_by(id: apply_params[:music_id])
        @apply.user_id = @current_user.id
        if @apply.save
            flash[:notice] = "申請が送信されました"
            flash[:success] = "申請が送信されました"
            redirect_to music_path(id: @music.id)
        else
            flash[:alert] = "申請に失敗しました"
            redirect_to music_path(id: @music.id)
        end
    end

    def video_create
      @apply = Apply.new(video_id: apply_params[:video_id])
      @video = Video.find_by(id: apply_params[:video_id])
      @apply.user_id = @current_user.id
      if @apply.save
        flash[:notice] = "申請が送信されました"
        flash[:success] = "申請が送信されました"
        redirect_to video_path(id: @video.id)
      else
        flash[:alert] = "申請に失敗しました"
        redirect_to video_path(id: @video.id)
      end
    end

    def post_update
        @apply = Apply.find_by(post_id: apply_params[:post_id])
        @apply.request_id = @current_user.id
        if @apply.save
          flash[:notice] = "ダウンロードを許可しました"
          redirect_to("/applies/#{@current_user.id}/index")
        else
          flash[:notice] = "ダウンロードの許可失敗しました"
          redirect_to("/applies/#{@current_user.id}/index")
        end
    end

    def movie_update
        @apply = Apply.find_by(movie_id: apply_params[:movie_id])
        @apply.request_id = @current_user.id
        if @apply.save
          flash[:notice] = "ダウンロードを許可しました"
          redirect_to("/applies/#{@current_user.id}/index")
        else
          flash[:notice] = "ダウンロードの許可失敗しました"
          redirect_to("/applies/#{@current_user.id}/index")
        end
    end

    def music_update
        @apply = Apply.find_by(music_id: apply_params[:music_id])
        @apply.request_id = @current_user.id
        if @apply.save
          flash[:notice] = "ダウンロードを許可しました"
          redirect_to("/applies/#{@current_user.id}/index")
        else
          flash[:notice] = "ダウンロードの許可失敗しました"
          redirect_to("/applies/#{@current_user.id}/index")
        end
    end

    def image_update
        @apply = Apply.find_by(image_id: apply_params[:image_id])
        @apply.request_id = @current_user.id
        if @apply.save
          flash[:notice] = "ダウンロードを許可しました"
          redirect_to("/applies/#{@current_user.id}/index")
        else
          flash[:notice] = "ダウンロードの許可失敗しました"
          redirect_to("/applies/#{@current_user.id}/index")
        end
    end

    def video_update
      @apply = Apply.find_by(video_id: apply_params[:video_id])
      @apply.request_id = @current_user.id
      if @apply.save
        flash[:notice] = "ダウンロードを許可しました"
        redirect_to("/applies/#{@current_user.id}/index")
      else
        flash[:notice] = "ダウンロードの許可失敗しました"
        redirect_to("/applies/#{@current_user.id}/index")
      end
    end

    def post_destroy
        @apply = Apply.find_by(post_id: apply_params[:post_id])
        if @apply
          @apply.destroy
          flash[:notice] = "申請を拒否しました"
        else
          flash[:alert] = "申請の拒否に失敗しました"
        end
        redirect_to("/applies/#{@current_user.id}/index")
    end

  
    def image_destroy
      @apply = Apply.find_by(image_id: apply_params[:image_id])
      if @apply
        @apply.destroy
        flash[:notice] = "申請を拒否しました"
      else
        flash[:alert] = "申請の拒否に失敗しました"
      end
      redirect_to("/applies/#{@current_user.id}/index")
    end

    def movie_destroy
        @apply = Apply.find_by(movie_id: apply_params[:movie_id])
        if @apply
          @apply.destroy
          flash[:notice] = "申請を拒否しました"
        else
          flash[:alert] = "申請の拒否に失敗しました"
        end
        redirect_to("/applies/#{@current_user.id}/index")
    end

    def music_destroy
        @apply = Apply.find_by(music_id: apply_params[:music_id])
        if @apply
          @apply.destroy
          flash[:notice] = "申請を拒否しました"
        else
          flash[:alert] = "申請の拒否に失敗しました"
        end
        redirect_to("/applies/#{@current_user.id}/index")
    end

    def video_destroy
      @apply = Apply.find_by(video_id: apply_params[:video_id])
      if @apply
        @apply.destroy
        flash[:notice] = "申請を拒否しました"
      else
        flash[:alert] = "申請の拒否に失敗しました"
      end
      redirect_to("/applies/#{@current_user.id}/index")
    end
  
    def index
      @applies = Apply.all.order(created_at: :desc)
      @apply = Apply.find_by(id: params[:id])
    end

    def ensure_correct_user
      @apply = Apply.find_by(id: params[:id])
      if @apply.user_id != @current_user.id
        flash[:notice] = "権限がありません"
        redirect_to action: :index
      end
    end
  
    private
  
    def apply_params
      params.require(:apply).permit(:post_id, :movie_id,:image_id,:music_id, :video_id)
    end
  end
  
