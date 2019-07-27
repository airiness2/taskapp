module LabelHelper
  def label_list
    Label.all.where(user_id: nil).or(Label.all.where(user_id: current_user.id))
  end
end
