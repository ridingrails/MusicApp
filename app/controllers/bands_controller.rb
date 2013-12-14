class BandsController < ApplicationController
  def new
    render :new
  end

  def index
    @bands = Band.all
  end

  def create
    band = Band.new(params[:band])
    if band.save
      redirect_to band_url(band)
    else
      flash[:errors] = band.errors.full_messages
      render :new
    end
  end

  def show
    @band = Band.find(params[:id])
  end
end
