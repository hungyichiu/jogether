module UserHelper
  def sign_up_amount(event)
    # link_to "更多內容", event_path(event) if true
    "<p class='card-text'><small class='text-muted'>目前報名人數：#{ event.applied_participants_logs.count }人</small></p>".html_safe if event.owner == current_user
  end 
end
