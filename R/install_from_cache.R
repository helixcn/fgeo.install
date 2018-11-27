install_from <- function(.install_from_location) {
  force(.install_from_location)

  function() {
    note_expected_r_environment()

    install_needed_dependencies()
    done(cran_packages, "All CRAN dependencies are installed.")

    if (!all_installed(needed(fgeo_packages))) {
      .install_from_location()
    }
    done(fgeo_packages, "All fgeo packages are installed.")

    ask_update_packages()
  }
}

install_needed_from_github <- function() {
  cat_line(cry_note("Installing needed fgeo packages from GitHub:"))

  repos <- paste0("forestgeo/", needed(fgeo_packages))
  remotes::install_github(repos, updgrade = "never", auth_token = .guest_pat)
}

install_needed_from_cache <- function() {
  cat_line(cry_note("Installing needed fgeo packages from cache:"))

  scheduled_bare <- gsub("_.*$", "", basename(fgeo_source()))
  needed <- scheduled_bare %in% needed(fgeo_packages)
  utils::install.packages(fgeo_source()[needed], repos = NULL, type = "source")

  invisible()
}

#' Install __fgeo__ from GitHub or cache.
#'
#' These functions install fgeo dependencies from CRAN and fgeo packages from
#' either GitHub or from a cache stored inside __fgeo.install__. They install
#' only the packages that are not already installed.
#'
#' @seealso [remotes::install_github], [remotes::update_packages()],
#' [utils::update.packages()].
#'
#' @export
#'
#' @examples
#' \dontrun{
#' install_from_github()
#' install_from_cache()
#' }
install_from_cache <- install_from(install_needed_from_cache)

#' @rdname install_from_cache
#' @export
install_from_github <- install_from(install_needed_from_github)

done <- function(x, msg) {
  if (all_installed(needed(x))) {
    cat_line(cry_done(msg))
  }

  invisible()
}
