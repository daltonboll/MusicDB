class SpotifySongsController < ApplicationController
  before_action :set_spotify_song, only: [:show, :edit, :update, :destroy]

  # GET /spotify_songs
  # GET /spotify_songs.json
  def index
    @spotify_songs = SpotifySong.all
  end

  # GET /spotify_songs/1
  # GET /spotify_songs/1.json
  def show
  end

  # GET /spotify_songs/new
  def new
    @spotify_song = SpotifySong.new
  end

  # GET /spotify_songs/1/edit
  def edit
  end

  # POST /spotify_songs
  # POST /spotify_songs.json
  def create
    @spotify_song = SpotifySong.new(spotify_song_params)

    respond_to do |format|
      if @spotify_song.save
        format.html { redirect_to @spotify_song, notice: 'Spotify song was successfully created.' }
        format.json { render :show, status: :created, location: @spotify_song }
      else
        format.html { render :new }
        format.json { render json: @spotify_song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spotify_songs/1
  # PATCH/PUT /spotify_songs/1.json
  def update
    respond_to do |format|
      if @spotify_song.update(spotify_song_params)
        format.html { redirect_to @spotify_song, notice: 'Spotify song was successfully updated.' }
        format.json { render :show, status: :ok, location: @spotify_song }
      else
        format.html { render :edit }
        format.json { render json: @spotify_song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spotify_songs/1
  # DELETE /spotify_songs/1.json
  def destroy
    @spotify_song.destroy
    respond_to do |format|
      format.html { redirect_to spotify_songs_url, notice: 'Spotify song was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spotify_song
      @spotify_song = SpotifySong.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spotify_song_params
      params.require(:spotify_song).permit(:spotifyID, :spotifyAlbumID, :spotifyArtistID, :discNumber, :durationMS, :explicit, :title, :popularity, :trackNumber)
    end
end
