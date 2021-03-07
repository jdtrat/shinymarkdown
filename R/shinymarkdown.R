#' Create a Markdown Editor
#'
#' Create an instance of a Markdown editor for text that may require formatting.
#'
#' @param inputId The \code{input} prefix used to access the value.
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
#'
#' @section Server value:
#'
#' A character string of the text input in two formats:
#' * Markdown, which may be accessed using the inputId with "_markdown" as a suffix.
#' * HTML, which may be accessed using the inputId with "_html" as a suffix.
#'
#' See the examples section for more an example.
#'
#' @export
#'
#' @examples
#'
#' if(interactive()) {
#'
#' library(shiny)
#' library(shinymarkdown)
#' ui <- fluidPage(
#' mdInput(inputId = "myEditor", height = "500px", hide_mode_switch = F)
#' )
#'
#' server <- function(input, output, session) {
#'
#' # Print the markdown version of what is typed
#' observe({print(input$myEditor_markdown)})
#'
#' # Print the HTML version of what is typed
#' observe({print(input$myEditor_html)})
#'
#' }
#'
#' shinyApp(ui, server)
#'
#' }
#'
mdInput <- function(inputId, min_height = "300px", height = "500px", preview_style = "tab", preview_highlight = FALSE, initial_edit_type = "markdown", hide_mode_switch = TRUE, language = "en-us", initial_value = NULL) {

  data <- list(inputId = inputId,
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

  shiny::tagList(
    htmltools::htmlDependency(
        name = "mdInput",
        version = utils::packageVersion("shinymarkdown"),
        package = "shinymarkdown",
        src = "assets",
        script = c("js/shinymarkdown-handlers.js"),
        stylesheet = c("css/codemirror.min.css", "css/toastui-editor.min.css")
      ),
    shiny::includeScript(system.file("assets/js/toastui-editor-all.min.js", package = "shinymarkdown")),
    shiny::tags$script(
      shiny::HTML(
        whisker::whisker.render(template = template,
                                data = data)
      )
    ),
    shiny::div(class = "md-editor",
               shiny::div(id = paste0(inputId, "_editor")
                          )
               )
  )

}

#' Hide the editor
#'
#' @param .id The \code{inputId} of the editor.
#'
#' @export
#'
#' @return NA; used for side effects to hide the editor instance defined with \code{\link{mdInput}}.
#'
#' @examples
#' if(interactive()) {
#'
#' library(shiny)
#' library(shinymarkdown)
#' ui <- fluidPage(
#' mdInput(inputId = "myEditor", height = "500px", hide_mode_switch = F)
#' )
#'
#' server <- function(input, output, session) {
#'
#' # Hide the editor
#' observeEvent(input$hide, {hide_ediotr(.id = "myEditor")})
#'
#' # Show the editor
#' obseveEvent(input$show, {show_editor(.id = "myEditor")})
#'
#' }
#'
#' shinyApp(ui, server)
#'
#' }
#'
hide_editor <- function(.id) {

  session <- shiny::getDefaultReactiveDomain()

  session$sendCustomMessage(
    "hide_editor",
    list(id = .id)
  )

}


#' Show the editor
#'
#' @param .id The \code{inputId} of the editor.
#'
#' @export
#' @return NA; used for side effects to show the editor instance defined with \code{\link{mdInput}}.
#'
#' @examples
#' if(interactive()) {
#'
#' library(shiny)
#' library(shinymarkdown)
#' ui <- fluidPage(
#' mdInput(inputId = "myEditor", height = "500px", hide_mode_switch = F)
#' )
#'
#' server <- function(input, output, session) {
#'
#' # Hide the editor
#' observeEvent(input$hide, {hide_ediotr(.id = "myEditor")})
#'
#' # Show the editor
#' obseveEvent(input$show, {show_editor(.id = "myEditor")})
#'
#' }
#'
#' shinyApp(ui, server)
#'
#' }
#'
show_editor <- function(.id) {

  session <- shiny::getDefaultReactiveDomain()

  session$sendCustomMessage(
    "show_editor",
    list(id = .id)
  )

}
