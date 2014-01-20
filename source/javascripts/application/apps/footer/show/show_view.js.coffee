@Brandymint.module "FooterApp.Show", (Show, App, Backbone, Marionette, $, _) ->
  
  class Show.Layout extends Marionette.Layout
    template: "footer/show/templates/layout"

    regions:
      mapRegion: "#map-region"

  class Show.Map extends Marionette.ItemView
    template: "footer/show/templates/_map"

    ui:
      map: ".footer-map-block"
      mapSwitch: "#map-switch"
      mapClose: "button.close" 

    events:
      "click @ui.mapSwitch": "toggle"
      "click @ui.mapClose": "close"

    toggle: (e) ->
      e.preventDefault()
      $(@ui.map).collapse "toggle"
      @

    open: ->
      $(@ui.map).collapse "show"
      @
    
    close: ->
      $(@ui.map).collapse "hide"
      @

    scrollTo: (speed = 500) ->
      $(window).load =>
        $('body').animate({
          scrollTop: $(@ui.map).offset().top
        }, speed)
      @