install_from <- function(.install_from_location) {
  force(.install_from_location)

  function() {
    inform_expected_r_environment()

    if (!all_installed(needed(cran_packages))) {
      install_needed_cran_packages()
    }
    done(cran_packages, "All CRAN dependencies are installed.")

    if (!all_installed(needed(fgeo_packages))) {
      .install_from_location()
    }
    done(fgeo_packages, "All fgeo packages are installed.")

    follow_up()
  }
}

install_needed_cran_packages <- function() {
  cat_line(cry_note("Installing fgeo dependencies from CRAN:"))

  utils::install.packages(pkgs = needed(cran_packages))

  invisible()
}

install_needed_from_github <- function() {
  cat_line(cry_note("Installing needed fgeo packages from GitHub:"))

  repos <- paste0("forestgeo/", needed(fgeo_packages))
  remotes::install_github(repos, updgrade = "never", auth_token = .guest_pat)

  invisible()
}

#' Install __fgeo__ from GitHub.
#'
#' This function installs __fgeo__ dependencies from CRAN and fgeo packages from
#' GitHub. It installs only the packages that are not already installed.
#'
#' @seealso [remotes::install_github], [follow_up].
#'
#' @export
#'
#' @examples
#' \dontrun{
#' install_fgeo()
#' }
install_fgeo <- install_from(install_needed_from_github)


install_needed_from_cache <- function() {
  cat_line(cry_note("Installing needed fgeo packages from cache:"))

  scheduled_bare <- gsub("_.*$", "", basename(fgeo_source()))
  needed <- scheduled_bare %in% needed(fgeo_packages)
  utils::install.packages(fgeo_source()[needed], repos = NULL, type = "source")

  invisible()
}



# Helpers -----------------------------------------------------------------

inform_expected_r_environment <- function() {
  cat_line(cry_note(crayon::bold("Expected R environment:")))

  cat_line(cry_note("* R version is recent"))

  cat_line(
    cry_note("* All packages are updated (run "),
    cry_code("`update.packages()`"),
    cry_note(")")
  )

  cat_line(cry_note("* No other R session is running"))

  cat_line(
    cry_note("* Current R session is clean (click "),
    cry_note(crayon::italic("Session > Restart R")), cry_note(")")
  )

  invisible()
}

all_installed <- function(pkgs) {
  identical(pkgs, character(0))
}

needed <- function(pkgs) {
  installed <- unname(rownames(utils::installed.packages()))
  setdiff(basename(pkgs), installed)
}

done <- function(x, msg) {
  if (all_installed(needed(x))) {
    cat_line(cry_done(msg))
  }

  invisible()
}

follow_up <- function() {
  cat_line(cry_note("Next you may run "), cry_code("`?follow_up`"))

  invisible()
}

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
