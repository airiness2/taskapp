namespace :expired_announcement do
    desc "有効期限通知バッチ"
  task expired_task: :environment do
    @users = User.all

    @users.each do |user|
      expire_date = Time.zone.today + 3
      @expiretasks = Task.all.where(user_id: user.id).where("endtime <= ?",  expire_date).where.not(status: :done)

      if @expiretasks.present?
        ExpireAnnounceMailer.expire_mail(user,@expiretasks).deliver
      end
    end
  end
end
