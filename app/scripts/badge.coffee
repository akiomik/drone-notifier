class @Badge
  green: [81, 163, 81, 217]
  red: [189, 54, 47, 230]

  update: (message) ->
    color = if message.status is 'success' then @green else @red
    chrome.browserAction.setBadgeBackgroundColor color: color
    chrome.browserAction.setBadgeText text: "#{message.num}"

