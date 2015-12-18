class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /songs
  # GET /songs.json
  def index
    @songs = Song.all
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
  end

  # GET /songs/new
  def new
    @song = Song.new
  end

  # GET /songs/1/edit
  def edit
  end

  # POST /songs
  # POST /songs.json
  def create
    @song = Song.new(song_params)

    respond_to do |format|
      if @song.save
        album_id = params["album"]
        
        if not album_id.nil?
          album = Album.find_by(id: album_id)
          if not album.nil?
            album.songs << @song
            album.save

            artist = album.artist

            if not artist.nil?
              artist_id = artist.id
              if not artist_id.nil?
                artist.songs << @song
                artist.save
              end
            end
          end
        end

        format.html { redirect_to @song, notice: 'Song was successfully created.' }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { render :new }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /songs/1
  # PATCH/PUT /songs/1.json
  def update
    respond_to do |format|
      if @song.update(song_params)
        album_id = params["album"]
        
        if not album_id.nil?
          album = Album.find_by(id: album_id)
          if not album.nil?
            album.songs << @song
            album.save

            artist = album.artist

            if not artist.nil?
              artist_id = artist.id
              if not artist_id.nil?
                artist.songs << @song
                artist.save
              end
            end
          end
        end
        
        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Song was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(:title, :billboardHot100Peak, :spotifyStreams, :amountSold, :radioPlayPeak, :isSingle, :hasMusicVideo, :explicit, :trackNumber, :discNumber, :spotifyID, :album, :durationMS, :popularity)
    end
end
