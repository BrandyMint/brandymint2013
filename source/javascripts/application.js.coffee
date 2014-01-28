#= require jquery/jquery.min
#= require jquery.role
#= require jquery.role/lib/jquery.role
#= require bootstrap

$ ->
  #$(".collapse").collapse()
  userAgent = navigator.userAgent
  android = userAgent.match(/(Android)/g)
  ios = userAgent.match(/(iPhone)/g) || userAgent.match(/(iPad)/g)
  coverImageHeight = $('@cover-image').height()
  lastScrollTop = 0
  unless (ios || android)
    $(window).on 'scroll', (event) ->
      st = $(this).scrollTop()
      if st > 100
        if st >= lastScrollTop || st == 0
          @hideNavbar(st, coverImageHeight)
          # downscroll code
        else
          @showNavbar(st, coverImageHeight)
          # upscroll code
      else
        #@hideNavbar()
      lastScrollTop = st

  $('.navbar-collapse a')
    .on 'click', (e) ->
      $(@).parents('.navbar-collapse').collapse('toggle')
      @showNavbar()

@appNavbar = $('.application-navbar.navbar-fixed-top')

@hideNavbar = (st, coverHeight) ->
  setTimeout(( ->
    @appNavbar.addClass('transparent')
  ), 200)

@showNavbar = (st, coverHeight) ->
  setTimeout(( ->
    @appNavbar.removeClass('transparent')
    if coverHeight? && st > coverHeight
      @appNavbar.addClass('navbar-white')
    else if st < coverHeight
      @appNavbar.removeClass('navbar-white')
  ), 200)

