class TracksController < ApplicationController
  def new
    render :new
  end

  def index
    @tracks = Track.all
  end

  def create
    track = Track.new(params[:track])
  end
end
