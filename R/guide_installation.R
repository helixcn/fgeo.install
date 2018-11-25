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
guide_installation <- function(pkgs) {
  cat_line("You need to install the following packages from CRAN:")
  cat_bullet(format(pkgs))
  cat_line()
  cat_line(
    cry_warn("1) Start a clean session by clicking 'Session > Restart R'")
  )
  cat_line(
    cry_warn("2) Run the following code then rerun "),
    cry_code("`fgeo.install::install_fgeo()`:")
  )
  cat_line()

  pkg_str <- paste0(deparse(pkgs), collapse = "\n")
  cat_line(cry_code("install.packages(", pkg_str, ")"))

  invisible(pkgs)
}

