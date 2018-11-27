install_needed_dependencies <- function() {
  if (!all_installed(needed(cran_packages))) {
    cat_line(cry_note("Installing fgeo dependencies from CRAN:"))
    utils::install.packages(pkgs = needed(cran_packages))
  }

  invisible()
}

all_installed <- function(pkgs) {
  identical(pkgs, character(0))
}
