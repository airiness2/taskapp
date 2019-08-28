namespace :expired_announcement do
  desc "お試しバッチ"
  task expired_task: :environment do
    ExpireAnnounceMailer.contact_mail(@contact).deliver
  end
end
