class ImagesController < ApplicationController
<<<<<<< HEAD
  before_action :authenticate_user
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
  before_action :set_image, only: [:show, :edit, :update, :destroy]
=======
        before_action :authenticate_user
        before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
        before_action :set_image, only: [:show, :edit, :update, :destroy]
>>>>>>> origin/main
        
        def new
          @image = Image.new
        end

        def create
<<<<<<< HEAD
          @image = Image.new(image_params)
=======
          @image = Image.new(
            image_params
            )
>>>>>>> origin/main
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
<<<<<<< HEAD
            @apply = Apply.find_by(image_id: @image.id)
=======
            @apply = Apply.find_by(movie_id: @movie.id)
>>>>>>> origin/main
          end
        end
    
        
        def edit
        end
        
        def update
<<<<<<< HEAD
=======
            
>>>>>>> origin/main
            if @image.update(image_params)
              flash[:notice] = "投稿を編集しました"
              redirect_to("/images/#{@image.id}")
            else
              render("images/edit")
            end
<<<<<<< HEAD
        end
=======
          end
>>>>>>> origin/main
        
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
<<<<<<< HEAD
=======


>>>>>>> origin/main
end
