require "podcast_api"

class PodcastsController < ApplicationController

  before_action :authorized, only: [:myList, :create, :remove]
  before_action :set_podcast, only: [:show, :remove, :destroy]

  # GET /podcasts
  def index
    render json: Podcast.all
  end

  # GET /podcasts/top
  def indexTop
    client = PodcastApi::Client.new(api_key: ENV["LISTEN_NOTES_API_KEY"])
    response = client.fetch_best_podcasts()
    render json: response
  end
  
  # GET /podcasts/my_list
  def myList
    @podcasts = @user.podcasts
    render json: @podcasts
  end

  # GET /podcasts/search?query=''
  def search
    query = params[:query]
    client = PodcastApi::Client.new(api_key: ENV["LISTEN_NOTES_API_KEY"])
    response = client.search(q: query, type: 'podcast')
    puts JSON.parse(response.body)
    render json: response.body
  end

  # GET /podcasts/1
  def show
    render json: @podcast
  end

  # POST /podcasts
  def create
    podcast = Podcast.where(api_id: podcast_params[:api_id]).first_or_create(podcast_params)
    podcast.users << @user if not podcast.users.include? @user
    if podcast.save
      render json: podcast, status: :created, location: podcast
    else
      render json: podcast.errors, status: :unprocessable_entity
    end
  end

  # DELETE /podcasts/my_list/:id
  def remove
    @podcast.users.delete @user
  end


  # PATCH/PUT /podcasts/1
  # def update
  #   if @podcast.update(podcast_params)
  #     render json: @podcast
  #   else
  #     render json: @podcast.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /podcasts/1
  def destroy
    @podcast.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_podcast
      @podcast = Podcast.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def podcast_params
      params.require(:podcast).permit(:api_id, :title, :publisher, :image, :total_episodes, :description, :website)
    end
end
