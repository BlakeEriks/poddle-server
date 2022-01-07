require "podcast_api"

class PodcastsController < ApplicationController

  before_action :authorized, only: [:myList, :add, :remove, :recommended]
  before_action :getClient, only: [:show, :indexTop, :search, :recommended]

  # GET /podcasts
  def index
    render json: Podcast.all
  end

  # GET /podcasts/1
  def show
    response = @client.fetch_podcast_by_id(id: params[:id])
    render json: response
  end

  # GET /podcasts/top
  def indexTop
    response = @client.fetch_best_podcasts()
    render json: response
  end
  
  # GET /podcasts/search?query=''
  def search
    response = @client.search(q: params[:query], type: 'podcast')
    render json: response.body
  end
  
  # GET /podcasts/recommended
  def recommended
    podcastLists = []
    if !@user.genres
      render json: podcastLists and return
    for genre in @user.genres
      podcastLists.push(@client.fetch_best_podcasts(genre_id: genre.api_id, region: 'us')['podcasts'])
    end
    podcasts = []
    for i in 0..podcastLists[0].length
      for list in podcastLists
        podcasts.push list[i]
      end
    end
    render json: podcasts
  end

  # GET /podcasts/my_list
  def myList
    render json: @user.podcasts
  end

  # POST /podcasts/my_list
  def add
    podcast = Podcast.where(api_id: podcast_params[:api_id]).first_or_create(podcast_params)
    podcast.users << @user if not podcast.users.include? @user
    if podcast.save
      render json: podcast, status: 200, location: podcast
    else
      render json: podcast.errors, status: :unprocessable_entity
    end
  end

  # DELETE /podcasts/my_list/:id
  def remove
    podcast = Podcast.where(api_id: params[:id]).first
    podcast.users.delete @user
    render json: podcast, status: 200
  end

  private
    # Only allow a list of trusted parameters through.
    def podcast_params
      params.require(:podcast).permit(:api_id, :title, :publisher, :image, :total_episodes, :description, :website)
    end

    def getClient
      @client = PodcastApi::Client.new(api_key: ENV["LISTEN_NOTES_API_KEY"])
    end

end