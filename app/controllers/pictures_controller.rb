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
    @picture = Picture.new(content:params[:content])
    @picture.save
    redirect_to("/pictures")
  end
end
