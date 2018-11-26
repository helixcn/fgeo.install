#' Install fgeo packages and ask or install their dependencies from CRAN.
#'
#' * `install_fgeo()` installs all __fgeo__ packages from source code stored in
#'   __fgeo.intall___. It requests all CRAN dependencies to be already
#'   installed.
#' * `install_dependencies()` installs from CRAN the dependencies of all
#' __fgeo__ packages.
#'
#' @param pkgs Character vector: Path to source packages to install.
#' @param ... Arguments passed to [utils::install.packages()].
#'
#' @return Invisible `NULL`.
#' @export
#'
#' @examples
#' \dontrun{
#' install_fgeo()
#' install_dependencies()
#' }
install_fgeo <- function(pkgs = fgeo_source()) {
  cran_deps <- needed(fgeo.install::cran_packages)

  if (!all_installed(cran_deps)) {
    return(guide_installation(cran_deps))
  } else {
    cran_done()

    cat_line(cry_note("Installing fgeo packages from source:"))
    utils::install.packages(pkgs, repos = NULL, type = "source")

    cat_line(
      cry_note("To check for updates run "),
      cry_code("`update.packages()` or `devtools::update_packages()`")
    )
  }

  invisible(pkgs)
}

#' @rdname install_fgeo
#' @export
install_dependencies <- function(...) {
  cran_deps <- needed(fgeo.install::cran_packages)

  if (all_installed(cran_deps)) {
    return(cran_done())
  }

  note_expected_r_environment()
  utils::install.packages(cran_deps, ...)
}

all_installed <- function(pkgs) {
  identical(pkgs, character(0))
}

cran_done <- function() {
  cat_line(cry_done("All CRAN dependencies are installed."))
}
