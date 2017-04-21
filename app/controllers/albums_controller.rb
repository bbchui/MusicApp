class AlbumsController < ApplicationController
  def index
    @albums = Album.all 
    render :index
  end

  def create
    @album = Album.new(album_params)
    if @album.valid?
      @album.save
      redirect_to band_url(@album.band)
    else
      flash[:errors] = "Album invalid"
      redirect_to bands_url
    end
  end

  def new
    @bands = Band.all
    @album = Album.new
    render :new
  end

  def show
    @album = Album.find_by(id: params[:id])
    render :show
  end

  def edit
    render :edit
  end

  def update
    @album = Album.find_by(name: params[:album][:name])
    if @album.update_attributes(album_params)
      @album.save
      redirect_to album_url(@album)
    else
      flash[:errors] = "Invalid Update"
      redirect_to edit_album_url(@album)
    end
  end

  def destroy
    @album = Album.find_by(name: params[:album][:name])
    @album.destroy
  end


  private
  def album_params
    params.require(:album).permit(:name, :band_id)
  end
end
