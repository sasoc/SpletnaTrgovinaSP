module RecordHelper
  def is_admin?
    if current_user.admin?
      true
    else
      false
    end
  end
end
