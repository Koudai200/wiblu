class PostsController < ApplicationController
    before_action :authenticate_user
    before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
    
    def index
      @posts = Post.all.order(created_at: :desc)
      @post = Post.find_by(id: params[:id])
    end

    def new
      @post = Post.new
    end
    
    def create
      @post = Post.new(
        content: params[:content],
        user_id: @current_user.id,
        body: params[:body],
        title: params[:title]
      )
      if @post.save
        flash[:notice] = "投稿を作成しました"
        redirect_to("/posts/index")
      else
        render("posts/new")
      end
    end
    
    def show
      @post = Post.find_by(id: params[:id])
      @user = User.find_by(id: @post.user_id)
      @likes_count = Like.where(post_id: @post).count
    end
    
    def edit
      @post = Post.find_by(id: params[:id])
    end
    
    def update
      @post = Post.find_by(id: params[:id])
      @post.content = params[:content]
      @post.body = params[:body]
      @post.title = params[:title]
      if @post.save
        flash[:notice] = "投稿を編集しました"
        redirect_to("/posts/index")
      else
        render("posts/edit")
      end
    end
    
    def destroy
      @post = Post.find_by(id: params[:id])
      @post.destroy
      flash[:notice] = "投稿を削除しました"
      redirect_to("/posts/index")
    end
    
    def ensure_correct_user
      @post = Post.find_by(id: params[:id])
      if @post.user_id != @current_user.id
        flash[:notice] = "権限がありません"
        redirect_to action: :index
      end
    end
    
  end
  
