notifier = new Notifier Options
chrome.browserAction.onClicked.addListener ->
  if notifier.isConfigured()
    chrome.tabs.create url: notifier.latest()
chrome.runtime.onInstalled.addListener (details) ->
  notifier.onInit()
chrome.alarms.onAlarm.addListener (alarm) ->
  notifier.onAlarm alarm

