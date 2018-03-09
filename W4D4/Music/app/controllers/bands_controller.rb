class BandsController < ApplicationController
  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to bands_url
    else
      flash[:errors] = 'Could not create account'
    end
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end
end
