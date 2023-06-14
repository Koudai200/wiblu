class MusicsController < ApplicationController
  before_action :set_music, only: %i[ show edit update destroy ]
  before_action :ensure_correct_user, {only: [:edit, :update]}

  # GET /musics or /musics.json
  def index
    @musics = Music.all.order(created_at: :desc)
  end

  # GET /musics/1 or /musics/1.json
  def show
    @music = Music.find_by(id: params[:id])
    @user = User.find_by(id: @music.user_id)
    @likes_count = Like.where(music_id: @music).count
  end

  # GET /musics/new
  def new
    @music = Music.new
  end

  # GET /musics/1/edit
  def edit
  end

  # POST /musics or /musics.json
  def create
    @music = Music.new(
      music_params
      )
    respond_to do |format|
      if @music.save
        format.html { redirect_to music_url(@music), notice: "投稿しました" }
        format.json { render :show, status: :created, location: @music }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @music.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /musics/1 or /musics/1.json
  def update
    if @music.update(music_params)
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/musics/#{@music.id}")
    else
      render("musics/edit")
    end
  end

  # DELETE /musics/1 or /musics/1.json
  def destroy
    @music.destroy

    respond_to do |format|
      format.html { redirect_to musics_url, notice: "削除されました" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_music
      @music = Music.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def music_params
      params.require(:music).permit(:file, :body, :content).merge(user_id: @current_user.id)
    end

    private
    def authenticate_user
      if @current_user == nil
          flash[:notice] = "ログインが必要です"
          redirect_to("/")
      end
    end

    def ensure_correct_user
      if @current_user.id != params[:id].to_i
        flash[:notice] = "権限がありません"
        redirect_to("/musics/index")
      end
    end

end
