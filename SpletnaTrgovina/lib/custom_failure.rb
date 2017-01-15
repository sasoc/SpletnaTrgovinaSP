class CustomFailure < Devise::FailureApp
  def redirect_url

    '#login'
  end

  def respond
    if http_auth?
      http_auth
    else
      flash.discard
      redirect
    end
  end
end
