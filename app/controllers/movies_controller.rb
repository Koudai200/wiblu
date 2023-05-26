class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :ensure_correct_user, {only: [:edit, :update]}

  # GET /movies
  # GET /movies.json
  def index
    @movies = Movie.all.order(created_at: :desc)
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
    @movie = Movie.find_by(id: params[:id])
    @user = User.find_by(id: @movie.user_id)
    @likes_count = Like.where(movie_id: @movie).count
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to movie_url(@movie), notice: 'MVを投稿しました。' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new, status: :unprocessable_entity}
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to movie_url(@movie), notice: 'MVを更新しました。' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

    # Use callbacks to share common setup or constraints between actions.
  def set_movie
    @movie = Movie.find(params[:id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def movie_params
    params.require(:movie).permit(:body, :video, :content).merge(user_id: @current_user.id)
  end

  def search
    @movies = Movie.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end

  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/movies/index")
    end
  end


end