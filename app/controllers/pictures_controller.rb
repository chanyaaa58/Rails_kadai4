class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  before_action :user_check_p, only: [:edit, :update]
  def index
    @pictures = Picture.all.order(created_at: :desc)
  end

  def show
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    if params[:back]
      render :new
    else
      if @picture.save
        PictureMailer.send_mail(@picture).deliver
        redirect_to pictures_path, notice: "投稿を作成しました"
      else
        render :new
      end
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

  def confirm
    @picture = current_user.pictures.build(picture_params)
    render :new if @picture.invalid?
  end

  private

  def picture_params
    params.require(:picture).permit(:content, :image, :image_cache)
  end
  def set_picture
    @picture = Picture.find(params[:id])
  end
  def user_check_p
    picture = Picture.find(params[:id])
      if picture.user_id != current_user.id
        redirect_to pictures_path, notice: "権限がありません"
      end
  end
end