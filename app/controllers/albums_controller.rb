class AlbumsController < ApplicationController

  # def index
  #   @albums = albums.all
  #   render :index
  # end

  def new
    @album = Album.new
    @bands = Band.all
    @current_band = Band.find_by_id(params[:band_id])
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
    redirect_to albums_url
  end

  private

  def album_params
    params.require(:album).permit(:title, :band_id)
  end
end
