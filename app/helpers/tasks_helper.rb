module TasksHelper
  def time_alert
    expire_date = Time.zone.today + 3
    @expirations = Task.all.where(user_id: current_user.id).where("endtime <= ?",  expire_date).where.not(status: :done)
    return @expirations if @expirations.present?
  end
end
