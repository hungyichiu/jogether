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
end
