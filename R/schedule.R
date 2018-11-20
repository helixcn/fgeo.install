plan <- c(
  "01" = "fgeo.x",
  "02" = "fgeo.base",
  "03" = "fgeo.ctfs",
  "04" = "fgeo.tool",
  "05" = "fgeo.map"
)

#' Schedule fgeo packages in the order they should be installed.
#'
#' @param pkgs
#'
#' @return
#' @export
#'
#' @examples
#' src <- fs::dir_ls("inst/extdata/source")
#' schedule(src, plan)
#'
#' pkgs <- fgeo::fgeo_dependencies("fgeo", include_self = FALSE)
#' schedule(pkgs, plan)
schedule <- function(pkgs, plan) {
  .plan <- rlang::set_names(glue("{names(plan)}_{plan}_"), plan)

  sort(stringr::str_replace_all(pkgs, .plan))
}

