$(document).ready( function () {
  const Editor = toastui.Editor;const editor = new Editor({el: document.querySelector('#editor'),usageStatistics: false, /* this will not be customizable. */ minHeight: '200px',height: '500px',previewStyle: 'vertical',initialEditType: 'markdown',language: 'en-US', initialValue: ``, placeholder: 'This is some placeholder text.'});

  /* Watch for Shiny sending message about wanting markdown */
  Shiny.addCustomMessageHandler("get_markdown", function (_) {

    const my_current_md_txt = editor.getMarkdown();

    /* Send current text back to shiny */
    Shiny.setInputValue("current_markdown", my_current_md_txt);

  });

});




