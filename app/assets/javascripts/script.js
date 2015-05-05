function readmore(elm, content) {
  $(elm).parent().find("p.text").html(content);
}

function validateSize(elm, maxSize) {
  var size = $(elm)[0].files[0].size;
  return size <= maxSize * 1024 * 1024;
}

$(document).ready(function() {
  $("#new_article").validate({
    rules: {
      "article[image]": {
        required: true,
        accept: "image/*"
      }
    },
    submitHandler: function(form) {
      if (!validateSize("#article_image", 5)) {
        alert("File size must <= 5MB");
        return false;
      }

      var formData = new FormData($(form)[0]);
      $.ajax({
        url: $(form).attr("action"),
        type: $(form).attr("method"),
        data: formData,
        async: false,
        cache: false,
        contentType: false,
        processData: false,
        success: function (data) {
          $("#article-template").tmpl(data).prependTo("#articles");
        }
      });
    }
  });
});
