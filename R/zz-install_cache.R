# The name of this file is prefixed zz- because it has to run after defining
# `install_from()`.

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
