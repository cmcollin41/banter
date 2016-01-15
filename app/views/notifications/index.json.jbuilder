json.array! @notifications do |notification|
  json.actor notification.actor.name
  json.action notification.action
  json.notifiable do 
    json.type "#{notification.notifiable.class.to_s.humanize.downcase}"
  end
  json.url conversation_path(notification.notifiable.conversation, anchor: dom_id(notification.notifiable))
end