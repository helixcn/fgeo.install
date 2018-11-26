source("data-raw/schedule.R")

# Paths to source packages, in the order they should be installed.
scheduled_packages <- schedule(list.files(fgeo.install:::path_source()), plan)

fgeo_packages <- fgeo::fgeo_pkgs()

cran_packages <- fgeo.install:::dependencies(
  fgeo::fgeo_pkgs(), exclude = "fgeo", section = "Imports"
)

use_data(
  cran_packages,
  fgeo_packages,
  scheduled_packages,
  overwrite = TRUE, internal = TRUE
)
