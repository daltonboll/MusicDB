class QuantoneArtistsController < ApplicationController
  before_action :set_quantone_artist, only: [:show, :edit, :update, :destroy]

  # GET /quantone_artists
  # GET /quantone_artists.json
  def index
    @quantone_artists = QuantoneArtist.all
  end

  # GET /quantone_artists/1
  # GET /quantone_artists/1.json
  def show
  end

  # GET /quantone_artists/new
  def new
    @quantone_artist = QuantoneArtist.new
  end

  # GET /quantone_artists/1/edit
  def edit
  end

  # POST /quantone_artists
  # POST /quantone_artists.json
  def create
    @quantone_artist = QuantoneArtist.new(quantone_artist_params)

    respond_to do |format|
      if @quantone_artist.save
        format.html { redirect_to @quantone_artist, notice: 'Quantone artist was successfully created.' }
        format.json { render :show, status: :created, location: @quantone_artist }
      else
        format.html { render :new }
        format.json { render json: @quantone_artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quantone_artists/1
  # PATCH/PUT /quantone_artists/1.json
  def update
    respond_to do |format|
      if @quantone_artist.update(quantone_artist_params)
        format.html { redirect_to @quantone_artist, notice: 'Quantone artist was successfully updated.' }
        format.json { render :show, status: :ok, location: @quantone_artist }
      else
        format.html { render :edit }
        format.json { render json: @quantone_artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quantone_artists/1
  # DELETE /quantone_artists/1.json
  def destroy
    @quantone_artist.destroy
    respond_to do |format|
      format.html { redirect_to quantone_artists_url, notice: 'Quantone artist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quantone_artist
      @quantone_artist = QuantoneArtist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quantone_artist_params
      params.require(:quantone_artist).permit(:quantoneID, :stageName, :artistType, :gender, :imageId, :spotifyId, :birthDate, :birthPlace, :deathDate, :deathPlace, :legalName, :age, :homeCountry, :homeRegion, :race, :debutYear)
    end
end
