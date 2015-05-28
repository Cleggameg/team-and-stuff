$(document).ready(function() {

  $(".team_creation_form").submit(function(event){
    var form = $(this);
    event.preventDefault();
    $.ajax({
      url: "/teams",
      method: "post",
      data: form.serialize(),
      success: function(response){
        $("#team_list").append(response.form);
        $(".team_text_area").val("");
      }
    });
  });

  $(".quick_team_delete").on("click", function(event){
    event.preventDefault();
    var delete_url = $(this).attr("href")
    $.ajax({
      url: delete_url,
      method: "delete",
      success: function(response){
        $("#" + response.link).css("display", "none")
      }
    });
  });

  $(".player_add_form").submit(function(event){
    var form = $(this);
    event.preventDefault();
    var form_action = form.attr('action');
    $.ajax({
      url: form_action,
      method: "post",
      data: form.serialize(),
      success: function(response){
        $("#player_list").append(response.form);
        $(".player_username").val("");
      }
    })
  })

});
