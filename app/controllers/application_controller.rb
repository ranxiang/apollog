class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :require_login

  before_filter :tag_cloud

  helper_method :current_user
  
  private
  def tag_cloud
    @tags = Article.tag_counts_on(:tags)
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    unless current_user 
      flash[:error] = "You must be logged in to access this page"
      redirect_to log_in_path # halts request cycle
    end
  end

end
