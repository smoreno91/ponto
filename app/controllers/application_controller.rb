class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :authenticate_user!, :only  => :dashboard
  before_filter :non_authenticate_user!, :except  => :dashboard

  def home
    
  end
  
  def company_registration
    
  end

  def dashboard
      
  end
  
  def check
    
  end
  
  private
    # Overwriting the sign_out redirect path method
    def after_sign_out_path_for(resource_or_scope)
      new_user_session_path
    end
  
  protected
    def non_authenticate_user!
      if user_signed_in?
        redirect_to dashboard_url
      end
    end
    
    def authenticate_user!
      if user_signed_in?
        super
      else
        redirect_to new_user_session_path, :notice => 'You have to log in first'
      end
    end
end
