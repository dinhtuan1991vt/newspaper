function readmore(elm, content) {
  $(elm).parent().find("p.text").html(content);
}

$(document).ready(function() {
  $.validator.addMethod('filesize', function(value, element, param) {
      return this.optional(element) || (element.files[0].size <= param) 
  }, "File too large."); 

  $("#new_article").validate({
    rules: {
      "article[image]": {
        accept: "image/*",
        filesize: 5242880
      },
      "article[video]": {
        accept: "video/*",
        filesize: 31457280
      }
    },
    submitHandler: function(form) { 
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

      return false;
    }
  });
});
