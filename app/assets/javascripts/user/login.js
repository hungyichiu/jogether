$(document).on('turbolinks:load', function () {
  $(".login-btn").click(function () {
    $('#loginPopup').modal('toggle')
  })
})