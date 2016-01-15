class Notifications
  constructor: ->
    @notifications = $("[data-behavior='notifications']")
    @setup() if @notifications.length > 0

  setup: ->
    $("[data-behavior='notifications-link']").on "click", @handleClick
    $.ajax(
      url: "/notifications.json"
      dataType: "JSON"
      method: "GET"
      success: @handleSuccess
    )

  handleClick: (e) =>
    $.ajax(
      url: "/notifications/mark_as_read"
      dataType: "JSON"
      method: "POST"
      success: ->
        $("[data-behavior='unread-count']").text(0)
    )

  handleSuccess: (data) =>
    items = $.map data, (notification) ->
      "<li><a class='dropdown-item' href='#{notification.url}'>#{notification.actor} #{notification.action} #{notification.notifiable.type}</a></li>"
    
    $("[data-behavior='unread-count']").text(items.length)
    
    if items.length > 0
      $("[data-behavior='notification-items']").html(items)
    else
      $("[data-behavior='notification-items']").html("<li><a>You have no new notifications</a></li>")


jQuery ->
  new Notifications
