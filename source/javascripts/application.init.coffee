@.APP =
  Routers : {}
  Models : {}
  Controllers : {}
  Collections : {}
  Views : 
    Items : {}
    Collections : {}
    Regions : {}
    Composites : {}
    Layouts : {}
  Helpers : {}
  MarionetteApp : new Backbone.Marionette.Application

  init : ->
    @MarionetteApp.on 'initialize:after', (options) ->
      @controller = new APP.Controllers.App()
      @router = new APP.Routers.App { @controller }

      APP.Controllers.app = @controller
      APP.Routers.app = @router

      if Backbone.history 
        Backbone.history.start {pushState : true, hashChange: false}
      
    @MarionetteApp.start()

$(document).ready -> APP.init()