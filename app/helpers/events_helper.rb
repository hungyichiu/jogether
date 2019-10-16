module EventsHelper
  def comment_name
    if user_signed_in?
      current_user.name  
    else
      ""  
    end   
  end

end
