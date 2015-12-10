require 'test_helper'

class SpotifyAlbumsControllerTest < ActionController::TestCase
  setup do
    @spotify_album = spotify_albums(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:spotify_albums)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create spotify_album" do
    assert_difference('SpotifyAlbum.count') do
      post :create, spotify_album: { albumType: @spotify_album.albumType, genres: @spotify_album.genres, images: @spotify_album.images, popularity: @spotify_album.popularity, releaseDate: @spotify_album.releaseDate, releaseDatePrecision: @spotify_album.releaseDatePrecision, spotifyArtistID: @spotify_album.spotifyArtistID, spotifyID: @spotify_album.spotifyID, title: @spotify_album.title }
    end

    assert_redirected_to spotify_album_path(assigns(:spotify_album))
  end

  test "should show spotify_album" do
    get :show, id: @spotify_album
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @spotify_album
    assert_response :success
  end

  test "should update spotify_album" do
    patch :update, id: @spotify_album, spotify_album: { albumType: @spotify_album.albumType, genres: @spotify_album.genres, images: @spotify_album.images, popularity: @spotify_album.popularity, releaseDate: @spotify_album.releaseDate, releaseDatePrecision: @spotify_album.releaseDatePrecision, spotifyArtistID: @spotify_album.spotifyArtistID, spotifyID: @spotify_album.spotifyID, title: @spotify_album.title }
    assert_redirected_to spotify_album_path(assigns(:spotify_album))
  end

  test "should destroy spotify_album" do
    assert_difference('SpotifyAlbum.count', -1) do
      delete :destroy, id: @spotify_album
    end

    assert_redirected_to spotify_albums_path
  end
end
