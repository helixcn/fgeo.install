#' Give installation instructions.
#'
#' @param pkgs Character vector: The names of the packages to install.
#'
#' @return Text output as with `cat()` and invisible `pkgs`.
#' @keywords internal
#'
#' @examples
#' guide_installation(c("pkg1", "pkg2"))
#' @noRd
guide_installation <- function(pkgs) {
  cat_line("You need to install the following dependencies:")
  cat_bullet(format(pkgs))
  cat_line()

  note_expected_r_environment()
  cat_line()

  cat_line(
    crayon::bold(
      cry_note("Run"),
      cry_code("`fgeo.install::install_dependencies()`")
    )
  )
  cat_line()

  invisible(pkgs)
}

note_expected_r_environment <- function() {
  cat_line(cry_note(crayon::bold("Expected R environment:")))

  cat_line(cry_note("* R version is recent"))

  cat_line(
    cry_note("* All packages are updated (run "),
    cry_code("`update.packages()`"),
    cry_note(")")
  )

  cat_line(cry_note("* No other R session is running"))

  cat_line(
    cry_note("* Current R session is clean (click "),
    cry_note(crayon::italic("Session > Restart R")), cry_note(")")
  )
}

note_update_packages <- function() {
  cat_line(
    cry_note("To check for updates run "),
    cry_code("`update.packages()` or `devtools::update_packages()`")
  )
}
