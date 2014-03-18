class @Message
  constructor: (params) ->
    @num = params.num
    @status = params.status

  isEmpty: ->
    @text is ''

