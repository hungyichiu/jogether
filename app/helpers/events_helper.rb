module EventsHelper

  def like_button(event)
    if user_signed_in?
      if event.like_events.by(current_user).exists?
        link_to content_tag(:i, :class => "far fa-heart"), event_like_path(event), method: :delete
      else
        link_to content_tag(:i, :class => "far fa-heart"), event_like_path(event), method: :delete
      end
    else 
      link_to new_user_session_path, notice: '請先登入會員'
    end
  end

end
