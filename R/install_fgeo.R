#' Ask users to install fgeo-dependencies from CRAN.
#'
#' @return Invisible `NULL`.
#' @export
#'
#' @examples
#' \dontrun{
#' install_fgeo()
#' }
install_fgeo <- function() {
  cran_packages <- needed(
    dependencies(fgeo::fgeo(), exclude = "fgeo", section = "Imports")
  )

  request_install(cran_packages)

  if (all_installed(cran_packages)) {
    cat_line(cry_note("Installing fgeo packages from source:"))
    utils::install.packages(fgeo_source(), repos = NULL, type = "source")

    cat_line(
      cry_note("To check for updates run "),
      cry_code("`remotes::update_packages()`")
    )
  }

  invisible()
}

request_install <- function(pkgs) {
  if (all_installed(pkgs)) {
    cat_line(cry_done("All CRAN dependencies are installed."))
    return(invisible(pkgs))
  }

  guide_installation(pkgs)
  invisible(pkgs)
}

all_installed <- function(pkgs) {
  identical(pkgs, character(0))
}

#' Paths to source packages, in the order they should be installed.
#'
#' @return Character vector.
#' @export
#'
#' @examples
#' fgeo_source()
fgeo_source <- function() {
  schedule(list.files(path_source(), full.names = TRUE), plan)
}

#' Path to inst/extdata/source.
#'
#' @return Character vector.
#' @export
#'
#' @examples
#' path_source()
path_source <- function() {
  system.file("extdata", "source", package = "fgeo.install")
}
