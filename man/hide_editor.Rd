% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/shinymarkdown.R
\name{hide_editor}
\alias{hide_editor}
\title{Hide the editor}
\usage{
hide_editor(.id)
}
\arguments{
\item{.id}{The \code{inputId} of the editor.}
}
\value{
NA; used for side effects to hide the editor instance defined with \code{\link{mdInput}}.
}
\description{
Hide the editor
}
\examples{
if(interactive()) {

library(shiny)
library(shinymarkdown)
ui <- fluidPage(
mdInput(inputId = "myEditor", height = "500px", hide_mode_switch = F)
)

server <- function(input, output, session) {

# Hide the editor
observeEvent(input$hide, {hide_ediotr(.id = "myEditor")})

# Show the editor
obseveEvent(input$show, {show_editor(.id = "myEditor")})

}

shinyApp(ui, server)

}

}
