require "test_helper"

class PodcastsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @podcast = podcasts(:one)
  end

  test "should get index" do
    get podcasts_url, as: :json
    assert_response :success
  end

  test "should create podcast" do
    assert_difference('Podcast.count') do
      post podcasts_url, params: { podcast: { api_id: @podcast.api_id, description: @podcast.description, image: @podcast.image, publisher: @podcast.publisher, title: @podcast.title, total_episodes: @podcast.total_episodes, website: @podcast.website } }, as: :json
    end

    assert_response 201
  end

  test "should show podcast" do
    get podcast_url(@podcast), as: :json
    assert_response :success
  end

  test "should update podcast" do
    patch podcast_url(@podcast), params: { podcast: { api_id: @podcast.api_id, description: @podcast.description, image: @podcast.image, publisher: @podcast.publisher, title: @podcast.title, total_episodes: @podcast.total_episodes, website: @podcast.website } }, as: :json
    assert_response 200
  end

  test "should destroy podcast" do
    assert_difference('Podcast.count', -1) do
      delete podcast_url(@podcast), as: :json
    end

    assert_response 204
  end
end
