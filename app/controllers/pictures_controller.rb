class PicturesController < ApplicationController
  def index
    @pictures = Picture.all.order(created_at: :desc)
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
  def edit
    @picture = Picture.find_by(id: params[:id])
  end
  def update
    @picture = Picture.find_by(id: params[:id])
    @picture.content = params[:content]
    @picture.save
    redirect_to("/pictures")
  end
  def destroy
    @picture = Picture.find_by(id: params[:id])
    @picture.content = params[:content]
    @picture.destroy
    redirect_to("/pictures")
  end
end
