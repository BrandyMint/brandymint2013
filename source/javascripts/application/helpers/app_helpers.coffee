APP.Helpers.App =
  showNavbar: ->
    $('.application-navbar.navbar-fixed-top').delay(200).addClass('transparent')

  hideNavbar: ->
    $('.application-navbar.navbar-fixed-top').removeClass('transparent')