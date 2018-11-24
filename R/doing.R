# # remove.packages("measurements")
fgeo_pkgs <- fgeo::fgeo_dependencies("fgeo")
deps <- list(fgeo = fgeo.install::dependencies(fgeo_pkgs, exclude = "fgeo"))
pkg_deps <- unique(sort(unlist(deps)))
