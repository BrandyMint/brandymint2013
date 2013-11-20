class APP.Controllers.App extends Marionette.Controller
  index: ->
    # index route

  map: =>
    unless $('#map').hasClass 'collapsed'
      $('#map').trigger 'click'

    $(window).load ->
      setTimeout (-> $('html, body').scrollTop( $(".application-footer").offset().top + $('.application-footer').height() )), 200