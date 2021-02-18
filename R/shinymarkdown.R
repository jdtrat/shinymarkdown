

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
        )
      )
    ),
    shiny::includeScript(system.file("assets/js/toastui-editor-all.min.js", package = "shinymarkdown"))
  )
}

#' Initialize the editor
#'
#' @inheritParams marker
#' @keywords internal
#' @return A script defining how to initialize the editor based on user specifications.
#'
init_editor <- function(min_height, height, preview_style, preview_highlight, initial_edit_type, hide_mode_switch, language, initial_value) {

  data <- list(match.call(),
               min_height = min_height,
               height = height,
               preview_style = preview_style,
               preview_highlight = base::tolower(preview_highlight),
               initial_edit_type = initial_edit_type,
               hide_mode_switch = base::tolower(hide_mode_switch),
               language = language,
               initial_value_lgl = ifelse(is.null(initial_value), FALSE, TRUE),
               initial_value = initial_value
  )

  template <- readLines(system.file("assets/js/init-template.js", package = "shinymarkdown"))

  shiny::tags$script(
    shiny::HTML(
      whisker::whisker.render(template = template,
                              data = data)
    )
  )
}

#' Add an editor instance
#'
#' Create the markdown editor
#'
#' @param min_height The editor's miniminum height value (pixels). Default = '300px'. Overwritten by the height parameter.
#' @param height The editor's height value, applied as a border-box. Example values include "300px", "100%", and "auto". Defaults to "500px".
#' @param preview_style The Markdown editor's preview style. Either "tab" or "vertical". Default is "tab".
#' @param preview_highlight Should the Markdown Editor's HTML preview have a highlighted element corresponding to the cursor position in the Markdown editor. Default is FALSE.
#' @param initial_edit_type Initial editor type: "markdown" or "wysiwyg". Default is "markdown".
#' @param hide_mode_switch Should the user be able to switch the editor mode from "wysiwyg" to "markdown" or vice versa? Default is TRUE.
#' @param language Editor language ISO code. Defaults to "en-us".
#' @param initial_value Should the editor have text already present? If so, supply a character string. Default is NULL.
#'
#' @return An instance of the markdown editor for use within a Shiny App.
#' @export
#'
marker <- function(min_height = "300px", height = "500px", preview_style = "tab", preview_highlight = FALSE, initial_edit_type = "markdown", hide_mode_switch = TRUE, language = "en-us", initial_value = NULL) {

  shiny::tagList(
  init_editor(min_height = min_height,
              height = height,
              preview_style = preview_style,
              preview_highlight = preview_highlight,
              initial_edit_type = initial_edit_type,
              hide_mode_switch = hide_mode_switch,
              language = language,
              initial_value = initial_value),
  shiny::div(id = "editor")
  )

}



#' Get the editor's markdown output
#'
#' @return A string containing the Markdown text entered into the editor.
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
#' @return A string containing the HTML code created from text entered into the Markdown editor.
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

#' Hide the editor
#'
#' @return NA; used for side effects to hide the editor.
#' @export
#'
hide_editor <- function() {

  session <- shiny::getDefaultReactiveDomain()

  session$sendCustomMessage(
    "hide_editor",
    list()
  )

}


#' Show the editor
#'
#' @return NA; used for side effects to show the editor.
#' @export
#'
show_editor <- function() {

  session <- shiny::getDefaultReactiveDomain()

  session$sendCustomMessage(
    "show_editor",
    list()
  )

}
