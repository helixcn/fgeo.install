#' Needed packages.
#'
#' @param pkgs Package names (CRAN) or paths to their source.
#' @noRd
needed <- function(pkgs) {
  installed <- unname(rownames(utils::installed.packages()))
  setdiff(fs::path_file(pkgs), installed)
}
