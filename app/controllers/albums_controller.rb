class AlbumsController < ApplicationController
  before_action :check_login
  # def index
  #   @albums = albums.all
  #   render :index
  # end

  def new
    @album = Album.new
    @bands = Band.all
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
    @bands = Band.all
  end

  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(album_params)
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end


  def show
    @album = Album.find_by_id(params[:id])
  end

  def destroy
    @album = Album.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to band_url(@album.band)
  end

  private

  def album_params
    params.require(:album).permit(:title, :band_id)
  end
end
