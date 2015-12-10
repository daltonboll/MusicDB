require 'test_helper'

class QuantoneArtistsControllerTest < ActionController::TestCase
  setup do
    @quantone_artist = quantone_artists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quantone_artists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quantone_artist" do
    assert_difference('QuantoneArtist.count') do
      post :create, quantone_artist: { age: @quantone_artist.age, artistType: @quantone_artist.artistType, birthDate: @quantone_artist.birthDate, birthPlace: @quantone_artist.birthPlace, deathDate: @quantone_artist.deathDate, deathPlace: @quantone_artist.deathPlace, debutYear: @quantone_artist.debutYear, gender: @quantone_artist.gender, homeCountry: @quantone_artist.homeCountry, homeRegion: @quantone_artist.homeRegion, imageId: @quantone_artist.imageId, legalName: @quantone_artist.legalName, quantoneID: @quantone_artist.quantoneID, race: @quantone_artist.race, spotifyId: @quantone_artist.spotifyId, stageName: @quantone_artist.stageName }
    end

    assert_redirected_to quantone_artist_path(assigns(:quantone_artist))
  end

  test "should show quantone_artist" do
    get :show, id: @quantone_artist
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quantone_artist
    assert_response :success
  end

  test "should update quantone_artist" do
    patch :update, id: @quantone_artist, quantone_artist: { age: @quantone_artist.age, artistType: @quantone_artist.artistType, birthDate: @quantone_artist.birthDate, birthPlace: @quantone_artist.birthPlace, deathDate: @quantone_artist.deathDate, deathPlace: @quantone_artist.deathPlace, debutYear: @quantone_artist.debutYear, gender: @quantone_artist.gender, homeCountry: @quantone_artist.homeCountry, homeRegion: @quantone_artist.homeRegion, imageId: @quantone_artist.imageId, legalName: @quantone_artist.legalName, quantoneID: @quantone_artist.quantoneID, race: @quantone_artist.race, spotifyId: @quantone_artist.spotifyId, stageName: @quantone_artist.stageName }
    assert_redirected_to quantone_artist_path(assigns(:quantone_artist))
  end

  test "should destroy quantone_artist" do
    assert_difference('QuantoneArtist.count', -1) do
      delete :destroy, id: @quantone_artist
    end

    assert_redirected_to quantone_artists_path
  end
end
