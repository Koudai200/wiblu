class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:index, :show, :edit, :update]}
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
  before_action :ensure_correct_user, {only: [:edit, :update]}
    
  def search
    @users = User.search(params[:keyword])
    @keyword = params[:keyword]
    render("users/index")
  end

  def index
    @users = User.all
  end
    
  def show
    @user = User.find_by(id: params[:id])

    @post = @user.posts
    @image = @user.images
    @music = @user.musics
    @movie = @user.movies

    @current_entry = Entry.where(user_id: @current_user.id)
    @another_entry = Entry.where(user_id: @user.id)
    unless @user.id == @current_user.id
        @current_entry.each do |current|
          @another_entry.each do |another|
            if current.room_id == another.room_id
              @is_room = true
              @room_id = current.room_id
            end
          end
        end
        unless @is_room
          @room = Room.new
          @entry = Entry.new
        end
    end
  end
    
  def new
    @user = User.new
  end
    
  def create
    @user = User.new(user_params)
    if @user.email.present? # メールアドレスが空でないことを確認
      if @user.save
        session[:user_id] = @user.id
        flash[:notice] = "ユーザー登録が完了しました"
        redirect_to user_path(@user)
      else
        render :new
      end
    else
      flash.now[:alert] = "メールアドレスを入力してください"
      render :new
    end
  end
    
  def edit
    @user = User.find_by(id: params[:id])
  end
    
  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.text = params[:text]
      
    if params[:image]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end
      
    if @user.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end
    
  def login_form
  end
    
  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to action: :index
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end
    
  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end

  def likes
    @user = User.find_by(id: params[:id])
    @likes = Like.where(user_id: @user.id)
  end
  
  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end
  
    private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :agreement)
  end
  
end
