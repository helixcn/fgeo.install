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
  please_install(needed(cran_dependencies))

  ok_cran <- identical(needed(cran_dependencies), character(0))
  if (ok_cran) message("* All dependencies are already installed.")

  fgeo <- src_pkg(src_paths())
  please_install(needed(fgeo), install_from_source)

  ok_fgeo <- identical(needed(fgeo), character(0))
  if (ok_fgeo) message("* The core fgeo packages are already installed.")

  invisible()
}

# Author: Hadley Wickham (via http://rstd.io/tidy-tools)
please_install <- function(pkgs, install_fun = install.packages) {
  if (length(pkgs) == 0) {
    return(invisible())
  }
  if (!interactive()) {
    stop("Please run in interactive session", call. = FALSE)
  }

  title <- paste0(
    "Ok to install these packges?\n",
    paste("* ", pkgs, collapse = "\n")
  )
  ok <- menu(c("Yes", "No"), title = title) == 1

  if (!ok) {
    return(invisible())
  }

  install_fun(pkgs)
}

# Adapted from Hadley Wickham (via http://rstd.io/tidy-tools)
needed <- function(pkgs) {
  have <- rownames(installed.packages())
  setdiff(pkgs, have)
}

install_from_source <- function(pkgs) {
  install.packages(pkg_src(pkgs), repos = NULL, type = "source")
}

src_paths <- function() {
  path <- system.file("extdata", "source", package = "fgeo.install")
  list.files(path, full.names = TRUE)
}

# Convert source paths to package names
src_pkg <- function(path) {
  gsub(".*(fgeo.*)_.*", "\\1", path)
}

# Convert package names to source paths
pkg_src <- function(pkgs) {
  unlist(lapply(pkgs, grep, src_paths(), value = TRUE))
}

