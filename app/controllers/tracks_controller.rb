class TracksController < ApplicationController
  def new
    @albums = Album.all
    render :new
  end

  def index
    @tracks = Track.find_by_album_id(params[:album_id])
  end

  def show
    @track = Track.find(params[:id])
  end

  def create
    track = Track.new(params[:track])
    if track.save
      redirect_to track_path(track)
    else
      flash[:errors] = track.errors.full_messages
      render :new
    end
  end
end
