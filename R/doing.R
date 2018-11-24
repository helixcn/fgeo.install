#' Title
#'
#' @return
#' @export
#'
#' @examples
#' install_cran_dependencies()
install_cran_dependencies <- function() {
  need <- needed(deps_cran()$package)
  if (identical(need, character(0))) {
    cli::cat_line("All CRAN dependencies are installed.")
    cli::cat_line("Check for updates with `update_cran_dependencies()`.")
    return(invisible())
  }
}


