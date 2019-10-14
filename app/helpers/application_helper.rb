module ApplicationHelper
  def avatar_tag(user, class_name: 'avatar', size: '100x100')
    if user.avatar.attached?
      image_tag user.avatar.variant(resize: size), class: class_name
    else
      image_tag "/default_avatar.png", size: size, class: class_name
    end
  end

  def activity_img(event, class_name: 'event-img' )
    if event.image.attached?
      image_tag event.image, class: class_name
    else
      image_tag "/default-activity-img.jpg",class: class_name
    end
  end

  def if_liked(event)
    # if current_user && current_user.liked?(event)
    if current_user&.liked?(event)
    
      link_to dislike_event_path(event),
      method: 'put',
      class: "ajxbtn btn redbg",
      remote: true,
      id: "like_#{event.id}" do
        '<i class="far fa-heart"></i>'.html_safe
      end
    else
      link_to add_like_event_path(event),
      method: 'put',
      class: "ajxbtn btn whitebg",
      remote: true,
      id: "like_#{event.id}" do
        '<i class="far fa-heart"></i>'.html_safe
      end
    end 
  end

  # def has_liked_event_class(event)
  #   if current_user.liked?(@event)
  #     link_to add_like_event_path(event),
  #     method: 'put',
  #     class: "ajxbtn btn btn-outline-danger redbg",
  #     remote: true,
  #     id: "like_#{event.id}" do %>
  #         <i class="far fa-heart"></i>
  # #         <% end %>
  #   else
  #     link_to add_like_event_path(event),
  #     method: 'put',
  #     class: "ajxbtn btn btn-outline-danger whitebg",
  #     remote: true
  #   end
  # end 
end
