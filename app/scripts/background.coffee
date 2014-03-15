options = Options.fetch() or Options.init()
notifier = new Notifier
  host: options.host
  service: options.service
  repository: options.repository

chrome.browserAction.onClicked.addListener ->
  chrome.tabs.create url: notifier.latest()
chrome.runtime.onInstalled.addListener ->
  notifier.onInit()
chrome.alarms.onAlarm.addListener ->
  notifier.onAlarm()

