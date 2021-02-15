# shinysurveys

#### Use a WYSIWYG Markdown Editor in Shiny

<!-- badges: start -->

[![Lifecycle: maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)

<!-- badges: end -->

{shinymarkdown} packages JavaScript's [Toast UI](https://github.com/nhn/tui.editor) Markdown editor for use in Shiny.

:bangbang: | **NOTE THAT THIS PACKAGE IS STILL UNDER ACTIVE DEVELOPMENT AND ITS API IS LIKELY TO CHANGE** |

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

{shinymarkdown} is still under active development, and its API is likely to change. For now, the following will generate a simple Markdown editor within a Shiny app. Note it is best to use in your browser window (Google Chrome or Safari).

``` {.r}
library(shiny)
library(shinymarkdown)
ui <- fluidPage(
  use_shinymd(),
  marker()
)

server <- function(input, output, session) {}

shinyApp(ui, server)
```

## Feedback

If you want to see a feature, or report a bug, please [file an issue](https://github.com/jdtrat/shinymarkdown/issues) or open a [pull-request](https://github.com/jdtrat/shinymarkdown/pulls)! As this package is just getting off the ground, we welcome all feedback and contributions. See our [contribution guidelines](.github/CONTRIBUTING.md) for more details on getting involved!

## Code of Conduct

Please note that the shinymarkdown project is released with a [Contributor Code of Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html). By contributing to this project, you agree to abide by its terms.
