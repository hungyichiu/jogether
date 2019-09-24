module ApplicationHelper
  def avatar_tag(user, class_name: 'avatar', size: '100x100')
    if user.avatar.attached?
      image_tag user.avatar.variant(resize: size), class: class_name
    else
      image_tag "#{Rails.root}/public/pictures/default_avatar.png", class: class_name
    end
    
  end
end
