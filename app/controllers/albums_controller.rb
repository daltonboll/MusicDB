class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /albums
  # GET /albums.json
  def index
    @albums = Album.all
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
  end

  # GET /albums/new
  def new
    @album = Album.new
  end

  # GET /albums/1/edit
  def edit
  end

  # POST /albums
  # POST /albums.json
  def create
    genres = params["album"]["genres"]

    if not genres.nil? and genres.is_a? String
      genres = genres.split(", ")
      params["album"][:genres] = genres
    end

    @album = Album.new(album_params)

    respond_to do |format|
      if @album.save
        artist_id = params["artist"]
        
        if not artist_id.nil?
          artist = Artist.find_by(id: artist_id)
          if not artist.nil?
            artist.albums << @album
            artist.save
          end
        end
        
        format.html { redirect_to @album, notice: 'Album was successfully created.' }
        format.json { render :show, status: :created, location: @album }
      else
        format.html { render :new }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /albums/1
  # PATCH/PUT /albums/1.json
  def update
    respond_to do |format|
      genres = params["album"]["genres"]

      if not genres.nil? and genres.is_a? String
        genres = genres.split(", ")
        params["album"][:genres] = genres
      end

      if @album.update(album_params)
        artist_id = params["artist"]
        
        if not artist_id.nil?
          artist = Artist.find_by(id: artist_id)
          if not artist.nil?
            artist.albums << @album
            artist.save
          end
        end

        format.html { redirect_to @album, notice: 'Album was successfully updated.' }
        format.json { render :show, status: :ok, location: @album }
      else
        format.html { render :edit }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    @album.destroy
    respond_to do |format|
      format.html { redirect_to albums_url, notice: 'Album was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_params
      params.require(:album).permit(:title, :amountSold, :billboard200Peak, :numberOfSingles, :releaseDate, :popularity, :albumType, :spotifyID, :artist, genres: [])
    end
end
