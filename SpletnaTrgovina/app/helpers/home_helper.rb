module HomeHelper

  def register_notice(notice)

    if (notice <=> "Invalid Email or password.") == 0
      false
    else
      true
    end
  end

  def login_notice(notice)

    if (notice <=> "Invalid Email or password.") == 0
      true
    else
      false
    end
  end

end
