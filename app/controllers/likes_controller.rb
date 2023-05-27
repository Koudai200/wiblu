class LikesController < ApplicationController
    before_action :authenticate_user
    
    def create
        @like = Like.new(user_id: @current_user.id, post_id: params[:post_id])

        respond_to do |format|
            if @like.save
                format.html { redirect_to "/posts/#{params[:post_id]}" }
                format.js { render "toggle" }
            else
                format.html { render "posts/index" }
                format.js
            end
        end
    end

    def music_create
        @like = @current_user.likes.new(music_id: params[:music_id])
        
        respond_to do |format|
            if @like.save
                format.html { redirect_to "/musics/#{params[:music_id]}" }
                format.js { render "toggle" }
            else
                format.html { render "musics/index" }
                format.js
            end
        end
    end

    def image_create
        @like = @current_user.likes.new(image_id: params[:image_id])
        
        respond_to do |format|
            if @like.save
                format.html { redirect_to "/images/#{params[:image_id]}" }
                format.js { render "toggle" }
            else
                format.html { render "images/index" }
                format.js
            end
        end
    end

    def movie_create
        @like = @current_user.likes.new(movie_id: params[:movie_id])
        
        respond_to do |format|
            if @like.save
                format.html { redirect_to "/movies/#{params[:movie_id]}" }
                format.js { render "toggle" }
            else
                format.html { render "movies/index" }
                format.js
            end
        end
    end

    def destroy
      @like = @current_user.likes.find_by(post_id: params[:post_id])

      respond_to do |format|
        if @like.destroy
          format.html { redirect_to "/posts/#{params[:post_id]}" }
          format.js { render "toggle" }
        else
          format.html { render "posts/index" }
          format.js 
        end
      end
    end

    def music_destroy
      @like = @current_user.likes.find_by(music_id: params[:music_id])
      
      respond_to do |format|
        if @like.destroy
          format.html { redirect_to "/musics/#{params[:music_id]}" }
          format.js { render "toggle" }
        else
          format.html { render "musics/index" }
          format.js 
        end
      end
    end

    def image_destroy
      @like = @current_user.likes.find_by(image_id: params[:image_id])
      
      respond_to do |format|
        if @like.destroy
          format.html { redirect_to "/images/#{params[:image_id]}" }
          format.js { render "toggle" }
        else
          format.html { render "images/index" }
          format.js 
        end
      end
    end

    def movie_destroy
        @like = @current_user.likes.find_by(movie_id: params[:movie_id])
        
        respond_to do |format|
            if @like.destroy
              format.html { redirect_to "/movies/#{params[:movie_id]}" }
              format.js { render "toggle" }
            else
              format.html { render "movies/index" }
              format.js 
            end
        end
    end


    def toggle
      case params[:resource_type]
      when "post"
        @like = Like.find_by(user_id: @current_user.id, post_id: params[:resource_id])
      when "image"
        @like = Like.find_by(user_id: @current_user.id, image_id: params[:resource_id])
      when "music"
        @like = Like.find_by(user_id: @current_user.id, music_id: params[:resource_id])
      when "movie"
        @like = Like.find_by(user_id: @current_user.id, movie_id: params[:resource_id])
      end
    
      if @like
        @like.destroy
        @liked = false
      else
        case params[:resource_type]
        when "post"
          @like = Like.create(user_id: @current_user.id, post_id: params[:resource_id])
        when "image"
          @like = Like.create(user_id: @current_user.id, image_id: params[:resource_id])
        when "music"
          @like = Like.create(user_id: @current_user.id, music_id: params[:resource_id])
        when "movie"
          @like = Like.create(user_id: @current_user.id, movie_id: params[:resource_id])
        end
        @liked = true
      end
    
      respond_to do |format|
        format.js
      end
    end
    
  end
