update_fgeo_source <- function() {
  pkgs <- fgeo::fgeo_dependencies("fgeo", include_self = FALSE)
  urls <- glue("forestgeo/{pkgs}")
  build_github(urls, "inst/extdata/source")
}
