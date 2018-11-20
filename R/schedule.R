plan <- c(
  "01" = "fgeo.x",
  "02" = "fgeo.base",
  "03" = "fgeo.ctfs",
  "04" = "fgeo.tool",
  "05" = "fgeo.map"
)

#' Prefix and separate matching patterns.
#'
#' Takes effect only on elements that match the patterns.
#'
#' @param x A character vector.
#' @param prefix A character vector with the format
#'   `c("prefix1" = "pattern1", "prefix2" = "pattern2")`.
#' @param sep Separator to surround the pattern with.
#'
#' @return A character vector.
#' @export
#'
#' @examples
#' x <- letters[1:3]
#' prefix <- c(
#'  "01" = "c",
#'  "01" = "b",
#'  "02" = "a"
#' )
#'
#' prefix(x, prefix)
#' prefix(x, prefix, sep = "")
#'
#' # Useful to reorder
#' sort(x)
#' x2 <- prefix(x, prefix, sep = "")
#' sort(x2)
#'
#' # Useful to plan the order in which these packages should be installed
#' pkgs <- fgeo::fgeo_dependencies("fgeo", include_self = FALSE)
#' plan <- c(
#'   "01" = "fgeo.x",
#'   "02" = "fgeo.base",
#'   "03" = "fgeo.ctfs",
#'   "04" = "fgeo.tool",
#'   "05" = "fgeo.map"
#' )
#' prefix(pkgs, plan)
prefix <- function(x, .prefix, sep = "_") {
  .prefix <- rlang::set_names(glue("{names(.prefix)}{sep}{.prefix}{sep}"), .prefix)

  sort(stringr::str_replace_all(x, .prefix))
}

