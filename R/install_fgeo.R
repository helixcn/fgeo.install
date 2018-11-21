#' Install fgeo from source code.
#'
#' @return No return.
#' @export
#'
#' @examples
#' \dontrun{
#' install_fgeo()
#' }
install_fgeo <- function() {
  from_cran <- install(needed(cran_dependencies))

  fgeo <- src_pkg(src_paths())
  from_src <- install(needed(fgeo), install_from_source)

  ok_cran <- identical(needed(cran_dependencies), character(0))
  if (ok_cran) {
    inform("All CRAN dependencies are already installed.")
  } else {
    from_cran <- paste0("* ", from_cran, collapse = "\n")
    inform(glue("Packages installed from CRAN:\n{from_cran}"))
  }

  ok_fgeo <- identical(needed(fgeo), character(0))
  if (ok_fgeo) {
    inform("All fgeo packages are already installed.")
  } else {
    pkg_nms <- fs::path_ext_remove(fs::path_ext_remove(fs::path_file(from_src)))
    pkg_nms <- paste0('* ', pkg_nms, collapse = '\n')
    inform(glue("Packages installed from source:\n{pkg_nms}"))
  }

  invisible()
}

# Author: Hadley Wickham (via http://rstd.io/tidy-tools)
install <- function(pkgs, install_fun = utils::install.packages) {
  if (length(pkgs) == 0) {
    return(invisible())
  }

  install_fun(pkgs)

  invisible(pkgs)
}

# Adapted from Hadley Wickham (via http://rstd.io/tidy-tools)
needed <- function(pkgs) {
  have <- rownames(utils::installed.packages())
  setdiff(pkgs, have)
}

install_from_source <- function(pkgs) {
  # TODO: Use remotes::install_local()?
  utils::install.packages(pkg_src(pkgs), repos = NULL, type = "source")
}

src_paths <- function() {
  path <- system.file("extdata", "source", package = "fgeo.install")
  list.files(path, full.names = TRUE)
}

# Convert source paths to package names
src_pkg <- function(path) {
  gsub(".*(fgeo[^-_]*).*", "\\1", path)
}

# Convert package names to source paths
pkg_src <- function(pkgs) {
  unlist(lapply(pkgs, grep, src_paths(), value = TRUE))
}

