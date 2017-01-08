class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end



  helper_method :resource, :resource_name, :devise_mapping
  private
    def after_sign_in_path_for(resource)
      root_path
    end

    def after_sign_out_path_for(resource_or_scope)
      root_path
    end
end
