#' Build fgeo source-packages from github into a local directory.
#'
#' @return Source packages (.tar.gz files).
#' @export
#'
#' @examples
#' \dontrun{
#' update_fgeo_source()
#' }
update_fgeo_source <- function() {
  pkgs <- fgeo::fgeo_dependencies("fgeo", include_self = FALSE)
  urls <- glue("forestgeo/{pkgs}")
  build_github(urls, "inst/extdata/source")
}
