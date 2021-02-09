const Editor = toastui.Editor;
const editor = new Editor({
  el: document.querySelector('#editor'),
  usageStatistics: false, // this will not be customizable.
  minHeight: '200px',
  height: '500px',
  previewStyle: 'vertical',
  initialEditType: 'markdown',
  language: 'en-US',
  initialValue: `
# Introducting {shinymarkdown}

> What do you think of this Shiny markdown editor?

I think it is **super** cool, and I am esxcited to use it!
`,
  placeholder: 'This is some placeholder text.'
});


