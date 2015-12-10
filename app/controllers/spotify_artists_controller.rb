class SpotifyArtistsController < ApplicationController
  before_action :set_spotify_artist, only: [:show, :edit, :update, :destroy]

  # GET /spotify_artists
  # GET /spotify_artists.json
  def index
    @spotify_artists = SpotifyArtist.all
  end

  # GET /spotify_artists/1
  # GET /spotify_artists/1.json
  def show
  end

  # GET /spotify_artists/new
  def new
    @spotify_artist = SpotifyArtist.new
  end

  # GET /spotify_artists/1/edit
  def edit
  end

  # POST /spotify_artists
  # POST /spotify_artists.json
  def create
    @spotify_artist = SpotifyArtist.new(spotify_artist_params)

    respond_to do |format|
      if @spotify_artist.save
        format.html { redirect_to @spotify_artist, notice: 'Spotify artist was successfully created.' }
        format.json { render :show, status: :created, location: @spotify_artist }
      else
        format.html { render :new }
        format.json { render json: @spotify_artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spotify_artists/1
  # PATCH/PUT /spotify_artists/1.json
  def update
    respond_to do |format|
      if @spotify_artist.update(spotify_artist_params)
        format.html { redirect_to @spotify_artist, notice: 'Spotify artist was successfully updated.' }
        format.json { render :show, status: :ok, location: @spotify_artist }
      else
        format.html { render :edit }
        format.json { render json: @spotify_artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spotify_artists/1
  # DELETE /spotify_artists/1.json
  def destroy
    @spotify_artist.destroy
    respond_to do |format|
      format.html { redirect_to spotify_artists_url, notice: 'Spotify artist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spotify_artist
      @spotify_artist = SpotifyArtist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spotify_artist_params
      params.require(:spotify_artist).permit(:name, :spotifyID, :images, :popularity, :genres)
    end
end
