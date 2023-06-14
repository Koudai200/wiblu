class ApplicationController < ActionController::Base
    before_action :set_current_user

    def set_current_user
        @current_user = User.find_by(id: session[:user_id])
    end

    def authenticate_user
        if @current_user == nil
            flash[:notice] = "ログインが必要です"
            redirect_to("/")
        end
    end

    def forbid_login_user
        if @current_user
            flash[:notice] = "すでにログインしています"
            redirect_to("/users/index")
        end
    end

    def search
        @keyword = params[:keyword]

        @users = User.search(@keyword)
        render("users/index") and return if @users.present?
          
        @images = Image.search(@keyword)
        render("images/index") and return if @images.present?
          
        @musics = Music.search(@keyword)
        render("musics/index") and return if @musics.present?
          
        @posts = Post.search(@keyword)
        render("posts/index") and return if @posts.present?
          
        @movies = Movie.search(@keyword)
        render("movies/index") and return if @movies.present?          
    end

end
