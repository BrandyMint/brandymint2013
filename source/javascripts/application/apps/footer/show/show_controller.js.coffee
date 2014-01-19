@Brandymint.module "FooterApp.Show", (Show, App, Backbone, Marionette, $, _) ->
  
  class Show.Controller extends Marionette.Controller
    
    initialize: ->
      @layout = @getLayoutView()

      @listenTo @layout, "show", =>
        @showMapRegion()

      App.footerRegion.show @layout
    
    showMapRegion: ->
      @mapView = @getMapView()
      App.reqres.setHandler "footer-map", =>
        @mapView

      @layout.mapRegion.show @mapView

    getLayoutView: ->
      new Show.Layout

    getMapView: ->
      new Show.Map