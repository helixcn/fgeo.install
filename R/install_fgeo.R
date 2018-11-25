#' Ask users to install fgeo-dependencies from CRAN.
#'
#' @param pkgs Character vector: Path to source packages to install.
#'
#' @return Invisible `NULL`.
#' @export
#'
#' @examples
#' \dontrun{
#' # Two packages from the top of the installation schedule.
#' install_fgeo(fgeo_source()[1:2])
#'
#' # All packags
#' install_fgeo()
#' }
install_fgeo <- function(pkgs = fgeo_source()) {
  cran_packages <- needed(fgeo.install::cran_packages)

  request_install(cran_packages)

  if (all_installed(cran_packages)) {
    cat_line(cry_note("Installing fgeo packages from source:"))
    utils::install.packages(pkgs, repos = NULL, type = "source")

    cat_line(
      cry_note("To check for updates run "),
      cry_code("`update.packages()` or `devtools::update_packages()`")
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

#' Path to source fgeo packages.
#'
#' @param path Character vector: Path to a file in inst/extdata/source.
#'
#' @return Character vector.
#' @export
#'
#' @examples
#' path_source()
#'
#' path_source(fgeo.install::scheduled_packages)
#' # Evocative shortcut
#' fgeo_source()
path_source <- function(path = NULL) {
  if (is.null(path)) {
    return(system.file("extdata", "source", package = "fgeo.install"))
  }

  system.file("extdata", "source", path, package = "fgeo.install")
}

#' @rdname path_source
#' @export
fgeo_source <- function() path_source(fgeo.install::scheduled_packages)
