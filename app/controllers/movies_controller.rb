class MoviesController < ApplicationController

  before_action :set_movie, except: [:index, :new, :create, :show]

  def index
    @movies = Movie.select(:id, :title).includes(:reviews)

    respond_to do |format|
      format.html
      format.json do
        render json: @movies.to_json( except: [:updated_at] )
      end
      format.xml { render xml: @movies }
    end
  end

  def show
    @movie = Movie.includes(:reviews).find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to @movie
    else
      render :new
    end
  end

  def edit
    @role = Role.find(params[:id])
  end

  def update
    @movie.update( movie_params )

    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Actor was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @movie.destroy
    redirect_to :movies
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :year)
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end

end
