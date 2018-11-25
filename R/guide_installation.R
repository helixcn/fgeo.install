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
#' guide_installation(c("pkg1", "pkg2"))
guide_installation <- function(pkgs,
  msg_issue = "You need to install the following packages from CRAN:",
  msg_hint = "Click 'Session > Restart R' to start a clean R session, then run:",
  bullets =  cli::cat_bullet(cry_warn(format(pkgs)))) {

  cat_line(cry_warn(msg_issue))
  cat_line()
  bullets
  cat_line()
  cat_line(cry_warn(msg_hint))
  cat_line()

  pkg_str <- paste0(deparse(pkgs), collapse = "\n")
  cat_line(cry_code("install.packages(", pkg_str, ")"))

  invisible(pkgs)
}

