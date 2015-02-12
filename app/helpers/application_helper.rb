module ApplicationHelper
  def fix_url(str)
    str.start_with?("http://") ? str : "http://" + str
  end

  def display_datatime(dt)
    dt.strftime("%m/%d/%Y %l:%M %P %Z")
  end
  
  def logged_in?
    !!current_user
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
    
end
