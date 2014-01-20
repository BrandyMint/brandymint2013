#= require jquery/jquery
#= require modernizr/modernizr
#= require bootstrap
#= require underscore/underscore
#= require backbone/backbone
#= require backbone.marionette/lib/backbone.marionette
#= require_tree ./application/config
#= require application/app
#= require_tree ./application/entities
#= require_tree ./application/apps
#= require_tree ./application/helpers

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
          Helpers.App.showNavbar()
          # downscroll code
        else
          Helpers.App.hideNavbar()
          # upscroll code
      else
        #APP.Helpers.App.showNavbar()
      lastScrollTop = st

  $('.navbar-collapse a')
    .on 'click', (e) ->
      $(@).parents('.navbar-collapse').collapse('toggle')
      Helpers.App.hideNavbar()