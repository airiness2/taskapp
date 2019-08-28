class ExpireAnnounceMailer < ApplicationMailer
  def expire_mail(user,expiretasks)
    @user = user
    @expiretasks = expiretasks
    mail to: user.email, subject: "期限間近タスク通知メール"
  end
end
