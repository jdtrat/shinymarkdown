$(document).ready( function () {
  const Editor = toastui.Editor;const editor = new Editor({el: document.querySelector('#editor'),usageStatistics: false, /* this will not be customizable. */ minHeight: '200px',height: '500px',previewStyle: 'vertical',initialEditType: 'markdown',language: 'en-US', initialValue: ``, placeholder: 'This is some placeholder text.'});

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

});




