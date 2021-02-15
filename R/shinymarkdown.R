

#' Use {shinymarkdown}
#'
#' Add the markdown editor dependencies to your Shiny app.
#'
#' @export
#'
use_shinymd <- function() {

  shiny::tagList(
    shiny::tags$head(
      shiny::tagList(
        shiny::tags$style(
          shiny::HTML(readLines(system.file("assets/css/codemirror.min.css", package = "shinymarkdown")))
        ),
        shiny::tags$style(
          shiny::HTML(readLines(system.file("assets/css/toastui-editor.min.css", package = "shinymarkdown")))
        ),
        shiny::tags$script(
          shiny::HTML(readLines(system.file("assets/js/init-editor.js", package = "shinymarkdown")))
        )
      )
    ),
    shiny::includeScript(system.file("assets/js/toastui-editor-all.min.js", package = "shinymarkdown"))
  )
}


#' Add an editor instance
#'
#' Create the markdown editor
#'
#' @export
#'
marker <- function() {

    shiny::div(id = "editor")

}


