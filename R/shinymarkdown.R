

use_shinymd <- function() {

  htmltools::tagList(
    htmltools::tags$head(
      htmltools::tagList(
        htmltools::tags$style(
          htmltools::HTML(readLines(system.file("assets/css/codemirror.min.css", package = "shinymarkdown")))
        ),
        htmltools::tags$style(
          htmltools::HTML(readLines(system.file("assets/css/toastui-editor.min.css", package = "shinymarkdown")))
        ),
      )
    ),
    htmltools::includeScript(system.file("assets/js/toastui-editor-all.min.js", package = "shinymarkdown"))
  )
}


marker <- function() {
  htmltools::tagList(
    htmltools::div(id = "editor"),
    htmltools::includeScript(system.file("assets/js/init-editor.js", package = "shinymarkdown"))
  )
}
