class AlbumsController < ApplicationController
  def new
    @bands = Band.all
  end

  def index
    @albums = Album.all
  end

  def create
    album = Album.new(params[:album])
    if album.save
      redirect_to album_path(album)
    else
      flash[:errors] = album.errors.full_messages
      render :new
    end
  end

  def show
    @album = Album.find(params[:id])
  end
end
