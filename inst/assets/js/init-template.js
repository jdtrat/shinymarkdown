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

{{#auto_lgl}}

// define debounce function
const debounce = function(func, delay) {
  let timeout;

  return function executed(...args) {
    const later = function() {
      clearTimeout(timeout);
      func(...args);
    };

    clearTimeout(timeout);
    timeout = setTimeout(later, delay);

  };

};

// define getEditorContents as a debounced function that sets the Shiny input values appropriately
var getEditorContents = debounce(function() {
    Shiny.setInputValue("{{inputId}}" + "_markdown", {{inputId}}_editor.getMarkdown());
    Shiny.setInputValue("{{inputId}}" + "_html", {{inputId}}_editor.getHtml());
}, {{refresh_rate}});

/* When someone types in the editor, make the markdown and HTML available
   as the Shiny/R inputs "shinymd_markdown" and "shinymd_html", respectively.
   This occurs after the debounce time to improve performance of Shiny apps.*/
$('#' + '{{inputId}}' + '_editor').on('keyup', getEditorContents);

});

{{ /auto_lgl }}

{{#manual_lgl}}

// create var switchSection which isolates the specific editor's footer button div
switchSection = $('#' + '{{inputId}}' + '_editor .te-mode-switch-section')[0];

// add a new button with sendShiny as its id
$(switchSection).append('<button id = "sendShiny"> Send to Shiny </button>');

// Add the button class and change some CSS defaults
$("#sendShiny").addClass("te-switch-button").css({"height": "19px", "width": "120px"});

// when the button is pressed add the active class and send the Shiny input values
$("#sendShiny").on("mousedown", function() {
  $(this).addClass("active");
  Shiny.setInputValue("{{inputId}}" + "_markdown", {{inputId}}_editor.getMarkdown());
  Shiny.setInputValue("{{inputId}}" + "_html", {{inputId}}_editor.getHtml());
});

// when the button is done being pressed remove the active class
$("#sendShiny").on("mouseup", function() {$(this).removeClass("active");});

});

{{ /manual_lgl }}
