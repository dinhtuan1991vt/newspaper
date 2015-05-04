function readmore(elm, content) {
  $(elm).parent().find("p.text").html(content);
}


$(document).ready(function() {

  $("#new_article").unbind('submit').bind('submit',function() {
    var formData = new FormData($(this)[0]);
    $.ajax({
      url: $(this).attr("action"),
      type: $(this).attr("method"),
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
  });
});
