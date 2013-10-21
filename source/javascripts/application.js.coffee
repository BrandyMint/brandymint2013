#  require_tree ./vendor
#  require_tree ./lib
#= require jquery/jquery.min
#= require bootstrap

$ ->
  #$(".collapse").collapse()
  photosQuantity = 4
  $('.j-random-bg').css('background-image', 'url("images/index_background_'+Math.floor((Math.random()*photosQuantity))+'.jpg")')

  userAgent = navigator.userAgent
  android = userAgent.match(/(Android)/g)
  ios = userAgent.match(/(iPhone)/g) || userAgent.match(/(iPad)/g)
  lastScrollTop = 0
  unless (ios || android)
    $(window).on 'scroll', (event) ->
      st = $(this).scrollTop()
      if st > 100
        if st >= lastScrollTop || st == 0
          @showNavbar()
          # downscroll code
        else
          @hideNavbar()
          # upscroll code
      else
        #@showNavbar()
      lastScrollTop = st

  $('.navbar-collapse a')
    .on 'click', (e) ->
      $(@).parents('.navbar-collapse').collapse('toggle')
      @hideNavbar()


@showNavbar = ->
  $('.application-navbar.navbar-fixed-top').delay(200).addClass('transparent')

@hideNavbar = ->
  $('.application-navbar.navbar-fixed-top').removeClass('transparent')


