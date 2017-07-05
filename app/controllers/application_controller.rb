class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :get_image_url, :get_user_url

  def authorize
    if !current_user
      flash[:alert] = "You aren't authorized to visit that page."
      redirect_to '/'
    end
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  def get_image_url(image)
    if image.id
      user_image_path
    else
      user_images_path
    end
  end

  def get_user_url(user)
    if user.id
      user_path
    else
      users_path
    end
  end

end
