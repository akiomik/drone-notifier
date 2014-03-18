options = new Options 'drone-notifier'

($ '#save').on 'click', (event) ->
  opts =
    host: ($ '#host').val()
    service: ($ '#service').val()
    repository: ($ '#repository').val()
  options.save opts

opts = options.fetch() or options.init()
($ '#host').val opts.host
($ '#service').val opts.service
($ '#repository').val opts.repository

