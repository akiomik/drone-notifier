($ '#save').on 'click', (event) ->
  options =
    host: ($ '#host').val()
    service: ($ '#service').val()
    repository: ($ '#repository').val()
  Options.save options

options = Options.fetch() or Options.init()
($ '#host').val options.host
($ '#service').val options.service
($ '#repository').val options.repository

