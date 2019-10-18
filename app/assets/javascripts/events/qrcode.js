$(document).on('turbolinks:load', function () {
  var qrcode = null;
  try {
    qrcode = new QRCode("qrcode");
  } catch {
    return ;
  }
  $(".qr-btn").click(function () {
    $('#eventQRCode').modal('toggle')
  })

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
