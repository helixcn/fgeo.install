#' Ask users to install fgeo-dependencies from CRAN.
#'
#' @param ... Arguments passed to [utils::install.packages()].
#'
#' @return Invisible `NULL`.
#' @export
#'
#' @examples
#' \dontrun{
#' install_fgeo()
#' }
install_fgeo <- function(...) {
  cran_pkgs <- needed(deps_cran()$package)

  request_from_cran(cran_pkgs)

  if (all_installed(cran_pkgs)) {
    cli::cat_line(cry_note("Installing fgeo packages from source:"))
    utils::install.packages(fgeo_source(), repos = NULL, type = "source", ...)
  }

  cli::cat_line(
    cry_note("Check for updates with: "),
    cry_code("remotes::update_packages()")
  )

  invisible()
}

request_from_cran <- function(pkgs) {
  if (all_installed(pkgs)) {
    cli::cat_line(cry_done("All CRAN dependencies are installed."))
    return(invisible(pkgs))
  }

  guide_installation(pkgs)
  invisible(pkgs)
}

all_installed <- function(pkgs) {
  identical(pkgs, character(0))
}

fgeo_source <- function() {
  schedule(fs::dir_ls(path_source()), plan)
}

path_source <- function() {
  system.file("extdata", "source", package = "fgeo.install")
}
