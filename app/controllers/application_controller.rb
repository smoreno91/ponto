class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, :only  => :dashboard
  before_action :non_authenticate_user!, :only  => [:home, :company_registration]
  load_and_authorize_resource except: [:home, :company_registration, :dashboard, :check]
  
  def home
    
  end
  
  def company_registration
    
  end

  def dashboard
      
  end
  
  def check
    #@company = Company.friendly.find(params[:slug])
    #logger.debug "============"
    #logger.debug "============"
    #logger.debug params[:slug]
    #logger.debug "Company attributes hash: #{@company.inspect}"
    #logger.debug "============"
    #logger.debug "============"
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to root_url, :alert => exception.message }
    end
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
      unless user_signed_in?
        redirect_to new_user_session_path, :notice => 'You have to log in first'
      else
        super
      end
    end
end
