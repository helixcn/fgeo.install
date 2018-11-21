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

  src <- "inst/extdata/source"
  if (dir_exists(src)) dir_delete(src)

  dir_create(src)
  build_github(urls, src)

  fs::file_move(dir_ls(src), prefix(dir_ls(src), plan))
}
