# shinysurveys

#### Use a WYSIWYG Markdown Editor in Shiny

<!-- badges: start -->

[![Lifecycle: maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)

<!-- badges: end -->

{shinymarkdown} packages JavaScript's [Toast UI](https://github.com/nhn/tui.editor) Markdown editor for use in Shiny.

### :bangbang: \| NOTE: THIS PACKAGE IS UNDER ACTIVE DEVELOPMENT AND ITS API IS LIKELY TO CHANGE \|

## Table of contents

-   [Installation](#installation)
-   [Demos](#demos)
-   [Feedback](#feedback)
-   [Code of Conduct](#code-of-conduct)

------------------------------------------------------------------------

## Installation

You can install the development version of {shinymarkdown} from Github with:

``` {.r}
devtools::install_github("jdtrat/shinymarkdown")
```

## Demos

{shinymarkdown} is still under active development, and its API is likely to change. It is best to use the editor in your browser window (Google Chrome or Safari). Below is an example of {shinymarkdown} with the left panel as the Markdown Editor and the right panel as the (live) HTML preview.

<img src="https://jdtrat.com/packages/shinymarkdown/resources/editor_preview_dev.png" style="border:5px solid black;"/>

### Basic Usage

If you just want to plop in an editor, the following code will work! For customizing the appearance/functionality of the Editor, please see the [advanced usage](#advanced-usage) section below or the documentation for the `mdInput()` function.

``` {.r}
library(shiny)
library(shinymarkdown)
ui <- fluidPage(
  mdInput(inputId = "editor1")
)

server <- function(input, output, session) {}

shinyApp(ui, server)
```

### Accessing the Editor's Contents

`mdInput()` is not *exactly* a typical Shiny input. Because we wanted to enable access to both the Markdown and HTML formats of user-input, we forwent the traditional Shiny input-binding. Instead, you can access either the Markdown or HTML versions of the editor's contents by suffixing the `inputId` with "_markdown" or "_html", respectively. For example:

``` {.r}
library(shiny)
library(shinymarkdown)
ui <- fluidPage(
  mdInput(inputId = "editor1", height = "300px", hide_mode_switch = F)
)

server <- function(input, output, session) {
  
  # Print the Markdown
  observe({print(input$editor1_markdown)})
  
  # Print the HTML
  observe({print(input$editor1_html)})
  
}

shinyApp(ui, server)
```

### Additional Features

#### Editor Customization

{shinymarkdown} provides different arguments for customizing the Markdown editor's appearance and functionality. The following options, accessible through `?marker()` are provided:

|      Parameter      |                                                                           Description                                                                           |
|:-------------------:|:---------------------------------------------------------------------------------------------------------------------------------------------------------------:|
|    `min_height`     |                           The editor's minimum height value (pixels). Default = '300px'. This is overwritten by the height parameter.                           |
|      `height`       |                  The editor's height value, applied as a border-box. Example values include "300px", "100%", and "auto". Defaults to "500px".                   |
|   `preview_style`   |                                       The Markdown editor's preview style. Either "tab" or "vertical". Default is "tab".                                        |
| `preview_highlight` | Should the Markdown Editor's HTML preview have a highlighted element corresponding to the cursor position in the Markdown editor. Default is FALSE. |
| `initial_edit_type` |                                              Initial editor type: "markdown" or "wysiwyg". Default is "markdown".                                               |
| `hide_mode_switch`  |                         Should the user be able to switch the editor mode from "wysiwyg" to "markdown" or vice versa? Default is TRUE.                          |
|     `language`      |                                                         Editor language ISO code. Defaults to "en-us".                                                          |
|   `iniial_value`    |                                 Should the editor have text already present? If so, supply a character string. Default is NULL.                                 |

#### Showing and Hiding the Editor

If you wish to show or hide the editor within your application, you can call the functions `show_editor()` and `hide_editor()`, respectively. They each take the an argument corresponding to the `inputId` of the editor you wish to show/hide. For example, if you have two editors in the same application:

```{.r}
library(shiny)
library(shinymarkdown)

ui <- fluidPage(
  mdInput(inputId = "editor1", height = "300px", hide_mode_switch = F),
  mdInput(inputId = "editor2", height = "300px", hide_mode_switch = F),
  actionButton("hide1", "Hide the First Editor"),
  actionButton("show1", "Show the First Editor"),
  actionButton("hide2", "Hide the Second Editor"),
  actionButton("show2", "Show the Second Editor")
)

server <- function(input, output, session) {
  
  # hide the first editor
  observeEvent(input$hide1, {hide_editor(.id = "editor1")})
  
  # show the first editor
  observeEvent(input$show1, {show_editor(.id = "editor1")})
  
  # hide the second editor
  observeEvent(input$hide2, {hide_editor(.id = "editor2")})
  
  # show the second editor
  observeEvent(input$show2, {show_editor(.id = "editor2")})
  
}

shinyApp(ui, server)
```


## Feedback

If you want to see a feature, or report a bug, please [file an issue](https://github.com/jdtrat/shinymarkdown/issues) or open a [pull-request](https://github.com/jdtrat/shinymarkdown/pulls)! As this package is just getting off the ground, we welcome all feedback and contributions. See our [contribution guidelines](.github/CONTRIBUTING.md) for more details on getting involved!

## Code of Conduct

Please note that the shinymarkdown project is released with a [Contributor Code of Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html). By contributing to this project, you agree to abide by its terms.
