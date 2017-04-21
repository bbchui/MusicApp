class BandsController < ApplicationController
  def index
    @bands = Band.all
    render :index
  end

  def create
    @band = Band.new(band_params)
    if @band.valid?
      @band.save
      redirect_to band_url(@band)
    else
      flash[:errors] = "Band invalid"
      redirect_to new_band_url
    end
  end

  def new
    @band = Band.new
    render :new
  end

  def show
    render :show
  end

  def edit
    render :edit
  end

  def update
    @band = Band.find_by(name: params[:band][:name])
    if @band.update_attributes(band_params)
      @band.save
      redirect_to band_url(@band)
    else
      flash[:errors] = "Invalid Update"
      redirect_to edit_band_url(@band)
    end
  end

  def destroy
    @band = Band.find_by(name: params[:band][:name])
    @band.destroy
  end


  private
  def band_params
    params.require(:band).permit(:name)
  end

end
