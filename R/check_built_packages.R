#' Check multiple built source-packages.
#'
#' @param pkgs Character vector: The paths to built source-packages to
#'   check.
#'
#' @return A [tibble][tibble-package].
#' @export
#'
#' @examples
#' \dontrun{
#' urls <- c("maurolepore/toy1", "maurolepore/toy2")
#' tmp <- tempdir()
#'
#' build_github(urls, tmp)
#' pkgs <- fs::dir_ls(tmp, glob = "*.tar.gz")
#' pkgs
#'
#' out <- check_built_packages()
#' out
#' }
check_built_packages <- function(pkgs = fgeo_source()) {
  is_source_package <- all(grepl("[.]tar[.]gz", pkgs))
  if (!is_source_package) abort("All `pkgs` must have extension .tar.gz")

  out <- map(pkgs, devtools::check_built)
  results <- out %>%
    map(~.x[c("errors", "warnings", "notes")]) %>%
    purrr::transpose() %>%
    map(tibble::enframe) %>%
    map(tidyr::unnest) %>%
    purrr::map_df(identity, .id = "flag")

  ok <- identical(nrow(results), 0L)
  if (!ok) warn("Some checks must be fixed.")

  results
}
