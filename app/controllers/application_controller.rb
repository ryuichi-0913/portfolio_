class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
      case resource
      when User
        users_user_path(current_user)
      when Admin
        admin_top_path
      end
    end
  end
