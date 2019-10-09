//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks


$(document).on('turbolinks:load', function () {
  $(".qr-btn").click(function () {
    $('#exampleModalCenter').modal('toggle')
  })

  var qrcode = new QRCode("qrcode");

  function makeCode() {
    var elText = document.getElementById("text");

    if (!elText.value) {
      alert("Input a text");
      elText.focus();
      return;
    }

    qrcode.makeCode(elText.value);
  }

  makeCode();

  $("#text").
    on("blur", function () {
      makeCode();
    }).
    on("keydown", function (e) {
      if (e.keyCode == 13) {
        makeCode();
      }
    });
})

