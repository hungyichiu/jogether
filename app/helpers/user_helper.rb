module UserHelper
  def abc
    link_to "更多內容", event_path(event) if true
    '<h1>dddd</h1>'.to_safe
  end 
end
