$(document).on('turbolinks:load', function () {
  $(".qr-btn").click(function () {
    $('#eventQRCode').modal('toggle')
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

$(document).ready(function () {
  var clipboard = new Clipboard('[class^="clipboard-btn"]');
});

< script src="https://cdn.rawgit.com/davidshimjs/qrcodejs/gh-pages/qrcode.min.js" ></script >

  <script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/1.7.1/clipboard.min.js"></script>