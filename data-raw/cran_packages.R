cran_packages <- fgeo.install::dependencies(
    fgeo::fgeo_pkgs(), exclude = "fgeo", section = "Imports"
)

use_data(cran_packages, overwrite = TRUE)
