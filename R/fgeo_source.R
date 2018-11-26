#' Create paths to the source version of __fgeo__ packages.
#'
#' @param path Character vector: Path to a file in inst/extdata/source.
#' @keywords internal
#'
#' @examples
#' \dontrun{
#' path_source()
#' fgeo_source()
#' }
#' @noRd
fgeo_source <- function() {
  path_source(scheduled_packages)
}

path_source <- function(path = NULL) {
  src <- system.file("extdata", "source", package = "fgeo.install")

  if (is.null(path)) {
    return(src)
  }

  out <- system.file("extdata", "source", path, package = "fgeo.install")

  exist <- vapply(out, file.exists, logical(1))
  if (!all(exist)) {
    valid <- paste0("* ", dir(src), collapse = "\n")
    stop("`path` must exist.\nValid paths:\n", valid, ").", call. = FALSE
    )
  }

  out
}

