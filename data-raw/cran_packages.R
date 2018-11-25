cran_packages <-
  fgeo.install::dependencies(fgeo::fgeo(), exclude = "fgeo", section = "Imports")

use_data(cran_packages, overwrite = TRUE)
