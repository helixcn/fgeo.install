#' Install __fgeo__ from GitHub.
#'
#' This is a lazy version of [remotes::install_github()], customized to install
#' __fgeo__. It is optimized for speed and
#' to increase the chances that the installation will succeed.
#' * It informs what is the expected R environment.
#' * It doesn't upgrade packages; instead it informs how you can do that.
#'
#' @inheritParams remotes::install_github
#' @param ... Other arguments passed to [remotes::install_github].
#'
#' @seealso [remotes::install_github], [install_dependencies()],
#'   [install_fgeo()].
#'
#' @export
#'
#' @examples
#' \dontrun{
#' install()
#' }
install <- function(upgrade = "never", auth_token = .github_pat, ...) {
  install_dependencies()
  remotes::install_github("forestgeo/fgeo", updgrade = upgrade, ...)
  note_update_packages()
}
