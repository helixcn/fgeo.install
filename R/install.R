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
install <- function(repo = "forestgeo/fgeo",
                    upgrade = "never",
                    auth_token = "disabled",
                    ...) {
  if (!identical(auth_token, "disabled")) {
    warning("Ignoring `auth_token` (intentionally disabled).", call. = FALSE)
  }

  install_dependencies()
  remotes::install_github(
    repo = repo, updgrade = upgrade, auth_token = .guest_pat, ...
  )
  note_update_packages()
}
