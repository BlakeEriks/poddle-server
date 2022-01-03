class GenresController < ApplicationController

    before_action :authorized, only: [:myGenres, :update]
    before_action :set_genres, only: [:update]

    def index
        render json: Genre.all
    end

    # GET /genres/my_list
    def myGenres
        render json: @user.genres
    end

    # PUT /genres/my_list
    def update
        @user.genres.clear<<@genres
        if @user.save
            render json: @user.genres, status: 200
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_genres
      @genres = Genre.where(id: params[:ids])
    end

end