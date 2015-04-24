$(document).ready(function() {
  $(".delete-post").click(function() {
    return confirm("Are you sure to delete this post?");
  });
});