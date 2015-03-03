
sendMessage = ->
  msg = $("#message").val()
  console.log msg
  now = new Date()
  Messages.insert {text: msg, datetime: now}
  $('#message').val('')


Template.inputbox.events
  'keypress input': (evt, template) ->
    if evt.which is 13
      sendMessage()
  'click #btnSend': sendMessage



Template.ticks.helpers
  messages: Messages.find {}, {sort: {datetime: -1}}
  prettyTime: (t) ->
    moment(t).fromNow()
	