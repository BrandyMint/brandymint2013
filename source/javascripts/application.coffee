#= require jquery/jquery
#= require modernizr/modernizr
#= require bootstrap
#= require underscore/underscore
#= require backbone/backbone
#= require backbone.marionette/lib/backbone.marionette
#= require application.init
#= require_tree ./application/controllers
#= require_tree ./application/collections
#= require_tree ./application/helpers
#= require_tree ./application/models
#= require_tree ./application/templates
#= require_tree ./application/views
#= require_tree ./application/routers

$ ->
  #$(".collapse").collapse()
  userAgent = navigator.userAgent
  android = userAgent.match(/(Android)/g)
  ios = userAgent.match(/(iPhone)/g) || userAgent.match(/(iPad)/g)
  lastScrollTop = 0
  unless (ios || android)
    $(window).on 'scroll', (event) ->
      st = $(this).scrollTop()
      if st > 100
        if st >= lastScrollTop || st == 0
          APP.Helpers.App.showNavbar()
          # downscroll code
        else
          APP.Helpers.App.hideNavbar()
          # upscroll code
      else
        #APP.Helpers.App.showNavbar()
      lastScrollTop = st

  $('.navbar-collapse a')
    .on 'click', (e) ->
      $(@).parents('.navbar-collapse').collapse('toggle')
      APP.Helpers.App.hideNavbar()

