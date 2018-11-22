pkgs <- fgeo::fgeo_dependencies("fgeo", FALSE)

cran_dependencies <- fgeo.install::dependencies(
  pkgs,
  exclude = "fgeo",
  section = "Imports"
)

use_data(cran_dependencies)
