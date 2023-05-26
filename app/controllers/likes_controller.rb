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
        @like = @current_user.likes.new(music_id: params[:music_id])
        if @like.save
          redirect_to("/musics/#{params[:music_id]}")
        else
            render("musics/index")
        end
    end

    def image_create
        @like = @current_user.likes.new(image_id: params[:image_id])
        if @like.save
          redirect_to("/images/#{params[:image_id]}")
        else
            render("images/index")
        end
    end

    def movie_create
        @like = @current_user.likes.new(movie_id: params[:movie_id])
        if @like.save
          redirect_to("/movies/#{params[:movie_id]}")
        else
            render("movies/index")
        end
    end

    def destroy
        @like = @current_user.likes.find_by(post_id: params[:post_id])
        @like.destroy
        redirect_to("/posts/#{params[:post_id]}")
    end

    def music_destroy
        @like = @current_user.likes.find_by(music_id: params[:music_id])
        @like.destroy
        redirect_to("/musics/#{params[:music_id]}")
    end

    def image_destroy
        @like = @current_user.likes.find_by(image_id: params[:image_id])
        @like.destroy
        redirect_to("/images/#{params[:image_id]}")
    end

    def movie_destroy
        @like = @current_user.likes.find_by(movie_id: params[:movie_id])
        @like.destroy
        redirect_to("/movies/#{params[:movie_id]}")
    end
    
  end
