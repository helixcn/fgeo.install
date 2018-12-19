fgeo_packages <- fgeo:::fgeo_packages()
cran_packages <- fgeo.install:::dependencies(fgeo_packages, exclude = "fgeo")
use_data(
  fgeo_packages,
  cran_packages,

  overwrite = TRUE
)
