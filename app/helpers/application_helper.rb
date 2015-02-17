module ApplicationHelper
  def fix_url(str)
    str.start_with?("http://") ? str : "http://" + str
  end

  def display_datatime(dt)
    dt.strftime("%m/%d/%Y %l:%M %P %Z")
  end
  
  def show_like_info

  end
  
  def show_cancel_like_info
    
  end
end
