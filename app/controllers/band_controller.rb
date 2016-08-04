class BandController < ApplicationController

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band)
    else
      render :new
    end
  end

  def update
    
  end

  def destroy
  end

  def band_params
    params.require(:band).permit(:name)
  end
end
