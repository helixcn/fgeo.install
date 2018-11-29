# The name of this file is prefixed zz- because it has to run after defining
# `install_from()`.

install_needed_from_cache <- function() {
  cat_line(cry_note("Installing needed fgeo packages from cache:"))

  scheduled_bare <- gsub("_.*$", "", basename(fgeo_source()))
  needed <- scheduled_bare %in% needed(fgeo_packages)
  utils::install.packages(fgeo_source()[needed], repos = NULL, type = "source")

  invisible()
}

#' Install __fgeo__ from cache.
#'
#' This function installs __fgeo__ dependencies from CRAN and fgeo packages from
#' a cache stored inside __fgeo.install__. It installs only the packages
#' that are not already installed.
#'
#' @seealso [remotes::install_github], [follow_up].
#' @examples
#' \dontrun{
#' install_cache()
#' }
#' @noRd
install_cache <- install_from(install_needed_from_cache)



# Helpers -----------------------------------------------------------------

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
