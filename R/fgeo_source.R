#' Create paths to the source version of __fgeo__ packages.
#'
#' @param path Character vector: Path to a file in inst/extdata/source.
#' @keywords internal
#'
#' @examples
#' \dontrun{
#' path_source()
#'
#' path_source(fgeo.install::scheduled_packages)
#' # Evocative shortcut
#' fgeo_source()
#' }
#' @noRd
fgeo_source <- function() {
  path_source(fgeo.install::scheduled_packages)
}

path_source <- function(path = NULL) {
  if (is.null(path)) {
    return(system.file("extdata", "source", package = "fgeo.install"))
  }

  system.file("extdata", "source", path, package = "fgeo.install")
}

