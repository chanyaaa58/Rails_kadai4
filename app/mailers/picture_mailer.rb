class PictureMailer < ApplicationMailer
  def send_mail(picture)
    @picture = picture
    mail to: "kanegonaja@gmail.com", subject: "【InstaApp投稿確認メールです】"
  end
end
