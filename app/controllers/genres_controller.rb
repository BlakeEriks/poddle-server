class GenresController < ApplicationController

    before_action :authorized, only: [:myGenres]
    before_action :set_genre, only: [:add]

    def index
        render json: Genre.all
    end

    # GET /genres/my_list
    def myGenres
        render json: @user.genres
    end

    # POST /genres/my_list
    def add
        genre = Genre.find(params[:id])
        genre.users << @user if not genre.users.include? @user
        if genre.save
            render json: genre, status: 200, location: genre
        else
            render json: genre.errors, status: :unprocessable_entity
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_genre
      @genre = Genre.find(params[:id])
    end

end