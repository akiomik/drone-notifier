class @Notifier
  constructor: (@_options) ->

  options: ->
    @_options.fetch() or @_options.init()

  host: ->
    @options().host

  service: ->
    @options().service

  repository: ->
    @options().repository

  isConfigured: ->
    @host() and @service() and @repository()

  url: ->
    "https://#{@host()}/#{@service()}/#{@repository()}"

  latest: ->
    "#{@url()}/latest"

  updateIcon: (num, status) ->
    color =
      if status is 'success'
        [81, 163, 81, 217]
      else
        [189, 54, 47, 230]
    chrome.browserAction.setBadgeBackgroundColor color: color
    chrome.browserAction.setBadgeText text: "#{num}"

  request: (callback) ->
    return unless @isConfigured()

    $.ajax
      url: @latest()
    .done (data) =>
      text = ($ data).find('#statusBtn').text()
      message = new Message text
      @updateIcon message.num, message.status
      callback(null, message) if callback?
    .fail (xhr, status) =>
      console.error 'request failed', status
      @updateIcon '-', 'error'
      callback(status, null) if callback?

