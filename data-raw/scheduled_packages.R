source("data-raw/schedule.R")

#' Paths to source packages, in the order they should be installed.
#'
#' @return Character vector.
#' @export
#'
#' @examples
#' fgeo_source()
scheduled_packages <- schedule(list.files(fgeo.install::path_source()), plan)
use_data(scheduled_packages, overwrite = TRUE)
