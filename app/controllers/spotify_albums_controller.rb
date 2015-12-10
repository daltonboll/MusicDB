class SpotifyAlbumsController < ApplicationController
  before_action :set_spotify_album, only: [:show, :edit, :update, :destroy]

  # GET /spotify_albums
  # GET /spotify_albums.json
  def index
    @spotify_albums = SpotifyAlbum.all
  end

  # GET /spotify_albums/1
  # GET /spotify_albums/1.json
  def show
  end

  # GET /spotify_albums/new
  def new
    @spotify_album = SpotifyAlbum.new
  end

  # GET /spotify_albums/1/edit
  def edit
  end

  # POST /spotify_albums
  # POST /spotify_albums.json
  def create
    @spotify_album = SpotifyAlbum.new(spotify_album_params)

    respond_to do |format|
      if @spotify_album.save
        format.html { redirect_to @spotify_album, notice: 'Spotify album was successfully created.' }
        format.json { render :show, status: :created, location: @spotify_album }
      else
        format.html { render :new }
        format.json { render json: @spotify_album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spotify_albums/1
  # PATCH/PUT /spotify_albums/1.json
  def update
    respond_to do |format|
      if @spotify_album.update(spotify_album_params)
        format.html { redirect_to @spotify_album, notice: 'Spotify album was successfully updated.' }
        format.json { render :show, status: :ok, location: @spotify_album }
      else
        format.html { render :edit }
        format.json { render json: @spotify_album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spotify_albums/1
  # DELETE /spotify_albums/1.json
  def destroy
    @spotify_album.destroy
    respond_to do |format|
      format.html { redirect_to spotify_albums_url, notice: 'Spotify album was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spotify_album
      @spotify_album = SpotifyAlbum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spotify_album_params
      params.require(:spotify_album).permit(:spotifyID, :albumType, :spotifyArtistID, :genres, :images, :title, :popularity, :releaseDate, :releaseDatePrecision)
    end
end
