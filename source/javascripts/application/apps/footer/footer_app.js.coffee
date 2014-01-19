@Brandymint.module "FooterApp", (FooterApp, App, Backbone, Marionette, $, _) ->
  
  class FooterApp.Router extends Marionette.AppRouter
    appRoutes:
      "map" : "showMap"
  
  API =
    showFooter: ->
      new FooterApp.Show.Controller

    showMap: ->
      mapView = App.request "footer-map"
      mapView.open()
      mapView.scrollTo()
  
  App.addInitializer ->
    new FooterApp.Router
      controller: API

  FooterApp.on "start", ->
    API.showFooter()