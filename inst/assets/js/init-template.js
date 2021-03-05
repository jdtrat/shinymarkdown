$(document).ready( function () {

const Editor = toastui.Editor;
const editor = new Editor({
  el: document.querySelector('#editor'),
  usageStatistics: false, /* this will not be customizable. */
  minHeight: '{{min_height}}',
  height: '{{height}}',
  previewStyle: '{{preview_style}}',
  previewHighlight: {{preview_highlight}},
  initialEditType: '{{initial_edit_type}}',
  hideModeSwitch: {{hide_mode_switch}},
  language: '{{language}}'{{#initial_value_lgl}},
  initialValue: `{{initial_value}}`,
  {{ /initial_value_lgl }}
});

  /* Watch for Shiny sending message about wanting markdown */
  Shiny.addCustomMessageHandler("get_markdown", function (_) {

    const current_md = editor.getMarkdown();

    /* Send current text back to shiny */
    Shiny.setInputValue("shinymd_markdown", current_md);

  });

  /* Watch for Shiny sending message about wanting html */
  Shiny.addCustomMessageHandler("get_html", function (_) {

    const current_html = editor.getHtml();

    /* Send current text back to shiny */
    Shiny.setInputValue("shinymd_html", current_html);

  });

  Shiny.addCustomMessageHandler("hide_editor", function (_) {

    editor.hide();

  });

  Shiny.addCustomMessageHandler("show_editor", function (_) {

    editor.show();

  });



});


