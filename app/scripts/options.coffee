class @Options
  @key: 'drone-notifier'
  @defaults:
    host: 'drone.io'
    service: 'github.com'
    repository: ''

  @fetch: ->
    item = localStorage.getItem @key
    JSON.parse item

  @init: ->
    options = Options.defaults
    Options.save options
    options

  @save: (options) ->
    item = JSON.stringify options
    localStorage.setItem @key, item

