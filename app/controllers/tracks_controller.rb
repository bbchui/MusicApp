class TracksController < ApplicationController

  def create
    @track = Track.new(track_params)
    if @track.valid?
      @track.save
      redirect_to track_url(@track)
    else
      flash[:errors] = "Track invalid"
      redirect_to new_album_track_url(params[:album_id])
    end
  end

  def new
    @albums = Album.all
    @track = Track.new
    render :new
  end

  def show
    @tracks = Track.all 
    render :show
  end

  def edit
    render :edit
  end

  def update
    @track = Track.find_by(name: params[:track][:name])
    if @track.update_attributes(track_params)
      @track.save
      redirect_to track_url(@track)
    else
      flash[:errors] = "Invalid Update"
      redirect_to edit_track_url(@track)
    end
  end

  def destroy
    @track = Track.find_by(name: params[:track][:name])
    @track.destroy
  end


  private
  def track_params
    params.require(:track).permit(:name, :album_id)
  end
end
