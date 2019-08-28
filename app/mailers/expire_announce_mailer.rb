class ExpireAnnounceMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = "test2@example.com"

    mail to: "test@example.com", subject: "お問い合わせの確認メール"
  end
end
