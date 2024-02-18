class ImagesController < ApplicationController

  before_action :authenticate_user
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
  before_action :set_image, only: [:show, :edit, :update, :destroy]
        
        def new
          @image = Image.new
        end

        def create
          @image = Image.new(image_params)
          if @image.save
            flash[:notice] = "投稿しました"
            redirect_to("/images/#{@image.id}")
          else
            render("images/new")
          end
        end

        def index
          @images = Image.all.order(created_at: :desc)
        end
        
        def show
          @image = Image.find_by(id: params[:id])
          @user = User.find_by(id: @image.user_id)
          @likes_count = Like.where(image_id: @image).count
          if @apply.nil?
            @apply = Apply.new
          else
            @apply = Apply.find_by(image_id: @image.id)
          end
        end
    
        
        def edit
        end
        
        def update
            if @image.update(image_params)
              flash[:notice] = "投稿を編集しました"
              redirect_to("/images/#{@image.id}")
            else
              render("images/edit")
            end
        end
        
        def destroy
          @image.destroy
          flash[:notice] = "投稿を削除しました"
          redirect_to("/images")
        end
        
        def ensure_correct_user
          @image = Image.find_by(id: params[:id])
          if @image.user_id != @current_user.id
            flash[:notice] = "権限がありません"
            redirect_to("/images/index")
          end
        end

        def set_image
          @image = Image.find_by(id: params[:id])
        end

        def image_params
          params.require(:image).permit(:image_name, :ctype, :body).merge(user_id: @current_user.id)
        end
end
