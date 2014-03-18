notifier = new Notifier Options

chrome.browserAction.onClicked.addListener ->
  return unless notifier.isConfigured()

  chrome.tabs.create url: notifier.latest()

chrome.runtime.onInstalled.addListener (details) ->
  chrome.alarms.create 'refresh', periodInMinutes: 5
  notifier.request()

chrome.alarms.onAlarm.addListener (alarm) ->
  return unless alarm.name is 'refresh'

  notifier.request()

