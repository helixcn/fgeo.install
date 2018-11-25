#' fgeo packages.
#'
#' @param include_self Logical. `FALSE` excludes "fgeo".
#'
#' @return Character vector.
#' @export
#'
#' @examples
#' fgeo()
#' fgeo(FALSE)
fgeo <- function(include_self = TRUE) {
  if (include_self) {
    return(fgeo.install::fgeo_packages)
  }

  grep("^fgeo$", fgeo.install::fgeo_packages, invert = TRUE, value = TRUE)
}
