notifier = new Notifier Options
badge = new Badge()

onRequest = (err, text) ->
  message =
    if err?
      new Message num: '-', status: 'error'
    else
      [num, status] = notifier.parse text
      new Message num: num, status: status
  badge.update message

chrome.browserAction.onClicked.addListener ->
  return unless notifier.isConfigured()

  chrome.tabs.create url: notifier.latest()

chrome.runtime.onInstalled.addListener (details) ->
  chrome.alarms.create 'refresh', periodInMinutes: 5
  notifier.request onRequest

chrome.alarms.onAlarm.addListener (alarm) ->
  return unless alarm.name is 'refresh'

  notifier.request (err, text) ->
    notifier.request onRequest

