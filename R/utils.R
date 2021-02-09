
# From Garrick Aden-Buie's tidyjs package:
# https://github.com/gadenbuie/tidyjs-r/blob/main/R/00-utils.R

pkg_lock_deps <- function(dep = NULL) {
  deps <- jsonlite::read_json(
    system.file("package-lock.json",
                package = "shinymark",
                mustWork = TRUE))
  if (is.null(dep)) {
    deps
  } else {
    deps$dependencies[[dep]]
  }
}
