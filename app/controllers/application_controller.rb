class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :set_online
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:dob,:address])
  end

  def set_online
            if !!current_user
                   $redis_onlines.set( current_user.id, nil, ex: 60 )
                  # 'ex: 10*60' - set time to live - 10 minutes
            end
  end


  private

  # set to online
  def set_online
    if !!current_user
      # using separate Redis database
      # such as $redis_onlines = Redis.new db: 15
      # value not need, only key
      $redis_onlines.set( current_user.id, nil, ex: 60 )
      # 'ex: 60 - set time to live - 60 seconds
    end
  end

end
