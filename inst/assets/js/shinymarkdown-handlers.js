// hide the editor when Shiny sends the message "hide_editor"
  Shiny.addCustomMessageHandler("hide_editor", function (params) {
    $('#' + params.id + '_editor').hide();
  });

  // show the editor when Shiny sends the message "show_editor"
  Shiny.addCustomMessageHandler("show_editor", function (params) {
    $('#' + params.id + '_editor').show();
  });
