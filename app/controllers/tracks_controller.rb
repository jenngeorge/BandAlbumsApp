class TracksController < ApplicationController
  before_action :check_login

  def new
    @track = Track.new
    @albums = Album.all
    render :new
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def edit
    @track = Track.find(params[:id])
    @albums = Album.all
  end

  def update
    @track = Track.find(params[:id])
    if @track.update_attributes(track_params)
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :edit
    end
  end


  def show
    @track = Track.find_by_id(params[:id])
  end

  def destroy
    @track = Track.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to album_url(@track.album)
  end

  private

  def track_params
    params.require(:track).permit(:title, :album_id, :description)
  end
end
