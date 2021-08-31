class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  def index
    @pictures = Picture.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    if @picture.save
      redirect_to pictures_path, notice: "投稿を作成しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @picture.update(picture_params)
      redirect_to pictures_path, notice: "投稿を編集しました"
    else
      render :edit
    end
  end

  def destroy
    @picture.destroy
    redirect_to pictures_path, notice:"投稿を削除しました"
  end

  private

  def picture_params
    params.require(:picture).permit(:content)
  end
  def set_picture
    @picture = Picture.find(params[:id])
  end
end
