class @Message
  constructor: (@text) ->
    [@num, @status] =
      if @isEmpty()
        ['', '']
      else
        [[], num, status] = text.split ' '
        [(num.substr 1), status.toLowerCase()]

  isEmpty: ->
    @text is ''

