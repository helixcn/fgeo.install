#' Build source packages (vectorized over `pkgs`).
#'
#' @param pkgs Character vector: Paths to each package to build.
#' @param src Length-1 string: Path to a directory to save the output.
#' @param ... Arguments to [devtools::build()].
#'
#' @return First argument, invisible.
#' @export
#'
#' @examples
#' \dontrun{
#' build_source(fgeo_pkgs(), fgeo_src())
#' }
build_source <- function(pkgs, src, ...) {
  force(pkgs)
  force(src)

  if (!fs::dir_exists(src)) fs::dir_create(src)

  purrr::walk2(pkgs, src, devtools::build, ...)

  invisible(pkgs)
}



# Helpers -----------------------------------------------------------------

#' Create relative paths to fgeo packages under a same parent.
#'
#' @keywords internal
#' @examples
#' # If you are in fgeo project
#' fgeo_pkgs()
#' fgeo_pkgs(include_self = TRUE)
#'
#' fgeo_src()
#' @noRd
fgeo_pkgs <- function(pkgs = "../", include_self = FALSE) {
  fs::path(
    fs::path_abs(pkgs),
    fgeo::fgeo_dependencies("fgeo", include_self = include_self)
  )
}

#' @rdname fgeo_pkgs
#' @noRd
fgeo_src <- function(src = "../fgeo") {
  fs::path(fs::path_abs(src), "/inst/extdata/source")
}
