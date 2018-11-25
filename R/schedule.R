plan <- c(
  "01" = "fgeo.x",
  "02" = "fgeo.base",
  "03" = "fgeo.ctfs",
  "04" = "fgeo.tool",
  "05" = "fgeo.map",
  "zz" = "fgeo"
)

#' Sort packages in the order they should be installed.
#'
#' @param pkgs Character vector: Normally the paths to source-packages to be
#'   installed.
#' @param plan Character vector. See examples.
#'
#' @return Character vector ordered as packages should be installed.
#' @export
#'
#' @examples
#' plan <- c(
#'   "01" = "fgeo.x",
#'   "02" = "fgeo.base",
#'   "03" = "fgeo.ctfs",
#'   "04" = "fgeo.tool",
#'   "05" = "fgeo.map"
#' )
#'
#' schedule(fgeo_source())
#'
#' # WARNING: Bad order -- for demonstration
#' # The rescheduling affects only the planed pakcages. Then alpha ordered.
#' plan <- c(
#'   "01" = "fgeo.map",
#'   "02" = "fgeo.x"
#' )
#'
#' schedule(fgeo_source())
schedule <- function(pkgs, plan) {
  x <- stats::setNames(pkgs, prefix(pkgs, plan))
  unname(x[sort(names(x))])
}

#' Prefix and separate matching patterns.
#'
#' Takes effect only on elements that match the patterns.
#'
#' @param x A character vector.
#' @param .prefix A character vector with the format
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
  pfx <- paste0(names(.prefix), sep, .prefix, sep)
  .prefix <- stats::setNames(pfx, .prefix)

  stringr::str_replace_all(x, .prefix)
}

