class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    !!current_user
  end
  
  def require_user
    if !logged_in?
    flash[:danger] = "Action could not be performed."
    redirect_to root_path
    end
  end

  def home_article
    @article = Article.new
  end

  def show_article_on_homepage
    @articles = Article.order("created_at desc").limit(5)
  end

end
