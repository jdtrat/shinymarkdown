

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



#' Get the editor's markdown output
#'
#' @export
#'
get_markdown <- function() {

  session <- shiny::getDefaultReactiveDomain()

  session$sendCustomMessage(
    "get_markdown",
    list()
  )

  return(session$input$shinymd_markdown)

}

#' Get the editor's HTML output
#'
#' @export
#'
get_html <- function() {

  session <- shiny::getDefaultReactiveDomain()

  session$sendCustomMessage(
    "get_html",
    list()
  )

  return(session$input$shinymd_html)

}
