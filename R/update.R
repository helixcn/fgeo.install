rename_filenames_by_installation_order <- function() {
  pattern_replacement <- c(
    "fgeo.x_"    = "01-fgeo.x_",
    "fgeo.base_" = "02-fgeo.base_",
    "fgeo.ctfs_" = "03-fgeo.ctfs_",
    "fgeo.tool_" = "04-fgeo.tool_",
    "fgeo.map_"  = "05-fgeo.map_",
    "fgeo_"      = "zz-fgeo_"
  )

  path <- fgeo.install:::src_paths()
  new_path <- stringr::str_replace_all(path, pattern_replacement)
  fs::file_move(path, new_path)
}
