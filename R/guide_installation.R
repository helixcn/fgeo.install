#' Give installation instructions.
#'
#' @param pkgs Character vector: The names of the packages to install.
#' @param msg_issue Character vector: A message about the general issue.
#' @param msg_hint Character vector: A message about the code to run.
#' @param bullets Bullets (see default).
#'
#' @return Text output as with `cat()` and invisible `pkgs`.
#' @export
#'
#' @examples
#' guide_installation(
#'   c("pkg1", "pkg2"),
#'   "You need to install the following packages from CRAN:",
#'   "Click 'Session > Restart R' to start a clean R session, then run:"
#' )
guide_installation <- function(pkgs,
                               msg_issue,
                               msg_hint,
                               bullets =  cli::cat_bullet(format(pkgs))) {
  cli::cat_line(msg_issue)
  cli::cat_line()
  bullets
  cli::cat_line()
  cli::cat_line(msg_hint)

  pkg_str <- paste0(deparse(pkgs), collapse = "\n")
  cli::cat_line("install.packages(", pkg_str, ")")

  invisible(pkgs)
}
