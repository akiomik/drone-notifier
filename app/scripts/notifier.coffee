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

  request: (callback) ->
    return unless @isConfigured()

    $.ajax
      url: @latest()
    .done (data) ->
      return unless callback?
      text = ($ data).find('#statusBtn').text()
      callback(null, text)
    .fail (xhr, status) ->
      console.error 'request failed', status
      callback(status, null) if callback?

  parse: (text) ->
    if text is ''
      ['', '']
    else
      [[], num, status] = text.split ' '
      [(num.substr 1), status.toLowerCase()]

