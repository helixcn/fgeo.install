#' Build source packages (vectorized over `pkgs`).
#'
#' @param pkgs Character vector: Paths to each package to build.
#' @param src Length-1 string: Path to a directory to save the output.
#'
#' @return First argument, invisible.
#' @export
#'
#' @examples
#' \dontrun{
#' build_source(fgeo_pkgs(), fgeo_src())
#'
#' withr::with_dir(
#'  "../fgeo",
#'   build_source(fgeo_pkgs(), fgeo_src())
#' )
#' }
build_source <- function(pkgs, src, branch = "master") {
  force(pkgs)
  force(src)

  if (!fs::dir_exists(src)) fs::dir_create(src)

  purrr::walk2(
    pkgs, src,
    ~build_branch(.x, .y, branch)
  )

  invisible(pkgs)
}

build_branch <- function(pkg, src, branch) {
  withr::with_dir(
    pkg, {
      head <- git2r::repository_head()$name
      git2r::checkout(".", branch)
      devtools::build(".", src)
      git2r::checkout(".", head)

      message(glue("
        Built ({branch}): {pkg}
        In: {src}
      "))
    }
  )
}


# Helpers -----------------------------------------------------------------

#' Create relative paths to fgeo packages under a same parent.
#'
#' @keywords internal
#' @examples
#' # If you are in fgeo project
#' fgeo_pkgs()
#' fgeo_pkgs(include_self = TRUE)
#'
#' fgeo_src()
#' @noRd
fgeo_pkgs <- function(pkgs = "../", include_self = FALSE) {
  fs::path(
    fs::path_abs(pkgs),
    fgeo::fgeo_dependencies("fgeo", include_self = include_self)
  )
}

#' @rdname fgeo_pkgs
#' @noRd
fgeo_src <- function(src = "../fgeo") {
  fs::path(fs::path_abs(src), "/inst/extdata/source")
}
