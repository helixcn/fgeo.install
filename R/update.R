#' Build fgeo source-packages from github into a local directory.
#'
#' @return Source packages (.tar.gz files).
#' @export
#'
#' @examples
#' \dontrun{
#' update_fgeo_source("../fgeo/inst/extdata/source")
#' }
update_fgeo_source <- function(src = "inst/extdata/source") {
  pkgs <- fgeo::fgeo_dependencies("fgeo", include_self = FALSE)
  urls <- glue("forestgeo/{pkgs}")

  if (dir_exists(src)) dir_delete(src)

  dir_create(src)
  build_github(urls, src)
}
