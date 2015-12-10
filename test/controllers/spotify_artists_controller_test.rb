require 'test_helper'

class SpotifyArtistsControllerTest < ActionController::TestCase
  setup do
    @spotify_artist = spotify_artists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:spotify_artists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create spotify_artist" do
    assert_difference('SpotifyArtist.count') do
      post :create, spotify_artist: { genres: @spotify_artist.genres, images: @spotify_artist.images, name: @spotify_artist.name, popularity: @spotify_artist.popularity, spotifyID: @spotify_artist.spotifyID }
    end

    assert_redirected_to spotify_artist_path(assigns(:spotify_artist))
  end

  test "should show spotify_artist" do
    get :show, id: @spotify_artist
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @spotify_artist
    assert_response :success
  end

  test "should update spotify_artist" do
    patch :update, id: @spotify_artist, spotify_artist: { genres: @spotify_artist.genres, images: @spotify_artist.images, name: @spotify_artist.name, popularity: @spotify_artist.popularity, spotifyID: @spotify_artist.spotifyID }
    assert_redirected_to spotify_artist_path(assigns(:spotify_artist))
  end

  test "should destroy spotify_artist" do
    assert_difference('SpotifyArtist.count', -1) do
      delete :destroy, id: @spotify_artist
    end

    assert_redirected_to spotify_artists_path
  end
end
