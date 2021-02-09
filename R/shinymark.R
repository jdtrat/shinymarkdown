

use_shinymark <- function() {

  htmltools::tagList(
    htmltools::tags$head(
      htmltools::tagList(
        htmltools::tags$style(
          htmltools::HTML(readLines(system.file("assets/css/codemirror.min.css", package = "shinymark")))
        ),
        htmltools::tags$style(
          htmltools::HTML(readLines(system.file("assets/css/toastui-editor.min.css", package = "shinymark")))
        ),
      )
    ),
    htmltools::includeScript(system.file("assets/js/toastui-editor-all.min.js", package = "shinymark"))
  )
}


marker <- function() {
  htmltools::tagList(
    htmltools::div(id = "editor"),
    htmltools::includeScript(system.file("assets/js/init-editor.js", package = "shinymark"))
  )
}




#
#
# head_sm <- function() {
#   htmltools::tags$head(
#     htmltools::tagList(
#       # htmltools::tags$script(
#       #   src = system.file("assets/js/toastui-editor-all.min.js", package = "shinymark")
#       # ),
#       htmltools::includeScript(system.file("assets/js/toastui-editor-all.min.js", package = "shinymark")),
#
# }
