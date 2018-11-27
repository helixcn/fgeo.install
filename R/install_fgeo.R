#' Install fgeo packages and ask or install their dependencies from CRAN.
#'
#' * `install_dependencies()` installs from CRAN the dependencies of all
#' __fgeo__ packages.
#' * `install_fgeo()` installs all __fgeo__ packages from source code stored in
#'   __fgeo.install___. It requests all CRAN dependencies to be already
#'   installed.
#'
#' @param pkgs Character vector: Path to source packages to install.
#' @param ... Arguments passed to [utils::install.packages()].
#'
#' @return
#'   * `install_dependencies()` returns invisible `NULL`.
#'   * `install_fgeo()` returns invisible `pkgs`.
#' @export
#'
#' @examples
#' \dontrun{
#' install_fgeo()
#' install_dependencies()
#' }
install_fgeo <- function(pkgs = fgeo_source()) {
  if (!all_installed(needed(cran_packages))) {
    return(guide_installation(needed(cran_packages)))
  } else {
    cran_done()

    cat_line(cry_note("Installing fgeo packages from source:"))
    utils::install.packages(pkgs, repos = NULL, type = "source")

    note_update_packages()
  }

  invisible(pkgs)
}

#' @rdname install_fgeo
#' @export
install_dependencies <- function(...) {
  cran_deps <- needed(cran_packages)

  if (all_installed(cran_deps)) {
    return(cran_done())
  }

  note_expected_r_environment()
  utils::install.packages(cran_deps, ...)

  invisible()
}

all_installed <- function(pkgs) {
  identical(pkgs, character(0))
}

cran_done <- function() {
  cat_line(cry_done("All CRAN dependencies are installed."))
}
