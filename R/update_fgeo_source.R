#' Build fgeo source-packages from github into a local directory.
#'
#' @return Source packages (.tar.gz files).
#' @export
#'
#' @examples
#' \dontrun{
#' update_fgeo_source("../fgeo/inst/extdata/source")
#' }
update_fgeo_source <- function(pkgs = fgeo::fgeo_dependencies("fgeo", FALSE),
                               src = "inst/extdata/source") {
  urls <- glue("forestgeo/{pkgs}")

  if (dir_exists(src)) dir_delete(src)

  dir_create(src)
  build_github(urls, src)
}
