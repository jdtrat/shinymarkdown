$(document).ready( function () {

const Editor = toastui.Editor;
const {{inputId}}_editor = new Editor({
  el: document.querySelector('#' + '{{inputId}}' + '_editor'),
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

  /* When someone types in the editor, make the markdown and HTML available
     as the Shiny/R inputs "shinymd_markdown" and "shinymd_html", respectively. */
  $('#' + '{{inputId}}' + '_editor').on('keyup', function() {
    Shiny.setInputValue("{{inputId}}" + "_markdown", {{inputId}}_editor.getMarkdown());
    Shiny.setInputValue("{{inputId}}" + "_html", {{inputId}}_editor.getHtml());
  })

});
