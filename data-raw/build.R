pkgs <- fgeo::fgeo_dependencies("fgeo")

purrr::walk(
  glue::glue("../{pkgs}"),
  ~devtools::build(pkg = .x, path = "./inst/extdata/source")
)
