class PicturesController < ApplicationController
  def index
    @pictures = Picture.all.order(created_at: :desc)
  end
  def show
    @picture = Picture.find_by(id: params[:id])
  end
  def new
    @picture =Picture.new
  end
  def create
    @picture = Picture.new(content:params[:content])
    if @picture.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/pictures")
    else
      render("pictures/new")
    end
  end
  def edit
    @picture = Picture.find_by(id: params[:id])
  end
  def update
    @picture = Picture.find_by(id: params[:id])
    @picture.content = params[:content]
    if @picture.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/pictures")
    else
      render("pictures/edit")
    end
  end
  def destroy
    flash[:notice] = "投稿を削除しました"
    @picture = Picture.find_by(id: params[:id])
    @picture.content = params[:content]
    @picture.destroy
    redirect_to("/pictures")
  end
end
