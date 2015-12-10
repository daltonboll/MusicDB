require 'test_helper'

class SpotifySongsControllerTest < ActionController::TestCase
  setup do
    @spotify_song = spotify_songs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:spotify_songs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create spotify_song" do
    assert_difference('SpotifySong.count') do
      post :create, spotify_song: { discNumber: @spotify_song.discNumber, durationMS: @spotify_song.durationMS, explicit: @spotify_song.explicit, popularity: @spotify_song.popularity, spotifyAlbumID: @spotify_song.spotifyAlbumID, spotifyArtistID: @spotify_song.spotifyArtistID, spotifyID: @spotify_song.spotifyID, title: @spotify_song.title, trackNumber: @spotify_song.trackNumber }
    end

    assert_redirected_to spotify_song_path(assigns(:spotify_song))
  end

  test "should show spotify_song" do
    get :show, id: @spotify_song
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @spotify_song
    assert_response :success
  end

  test "should update spotify_song" do
    patch :update, id: @spotify_song, spotify_song: { discNumber: @spotify_song.discNumber, durationMS: @spotify_song.durationMS, explicit: @spotify_song.explicit, popularity: @spotify_song.popularity, spotifyAlbumID: @spotify_song.spotifyAlbumID, spotifyArtistID: @spotify_song.spotifyArtistID, spotifyID: @spotify_song.spotifyID, title: @spotify_song.title, trackNumber: @spotify_song.trackNumber }
    assert_redirected_to spotify_song_path(assigns(:spotify_song))
  end

  test "should destroy spotify_song" do
    assert_difference('SpotifySong.count', -1) do
      delete :destroy, id: @spotify_song
    end

    assert_redirected_to spotify_songs_path
  end
end
