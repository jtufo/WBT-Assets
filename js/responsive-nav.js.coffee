$ ->
  $(document).on 'click', 'a.responsive-nav-btn', (e) ->
    e.preventDefault()
    $('body').toggleClass('responsive-nav')
