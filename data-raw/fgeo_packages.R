fgeo_packages <- fgeo::fgeo_pkgs()
cran_packages <- dependencies(fgeo_packages, exclude = "fgeo")
use_data(
  fgeo_packages,
  cran_packages,

  overwrite = TRUE
)
