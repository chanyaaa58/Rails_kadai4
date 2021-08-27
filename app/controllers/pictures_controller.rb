class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end
  def show
    @picture = Picture.find_by(id: params[:id])
  end
  def new
  end
  def create
    redirect_to("/pictures")
  end
end
