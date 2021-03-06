#' Find all dependencies of some packages.
#'
#' @param pkgs Character vector: The name of installed packages.
#' @param exclude String. Pattern to exclude from output.
#' @param section Length-1 character vector: Section of DESCRITION to include.
#'
#' @author Adapted from __tidyverse__.
#'
#' @return Character vector.
#' @keywords internal
#'
#'
#' @examples
#' dependencies("fgeo.install")
#' dependencies("crayon")
#' dependencies("crayon", exclude = "utils")
#' dependencies("fgeo.install", section = "Suggests")
#' @noRd
dependencies <- function(pkgs, exclude = NULL, section = "Imports") {
  deps <- sort(unique(Reduce(c, dependencies_ls(pkgs, section))))

  if (!is.null(exclude)) {
    deps <- grep(exclude, deps, value = TRUE, invert = TRUE)
  }

  deps
}

#' @rdname dependencies
#' @noRd
dependencies_ls <- function(pkgs, section = "Imports") {
  raws <- lapply(
    pkgs, function(x) utils::packageDescription(x)[[sanitize_section(section)]]
  )

  raws <- stats::setNames(raws, pkgs)
  lapply(raws, clean_raw)
}

clean_raw <- function(raw) {
  if (is.null(raw)) {
    return(character(0))
  }

  pulled <- strsplit(raw, ",")[[1]]
  parsed <- gsub("^\\s+|\\s+$", "", pulled)
  .names <- vapply(strsplit(parsed, " +"), "[[", 1, FUN.VALUE = character(1))

  remove_version(.names)
}

sanitize_section <- function(section) {
  if (length(section) > 1) {
    warning("Using ", section[[1]], call. = FALSE)
  }
  section <- section[[1]]

  expected_sections <- c("Imports", "Suggests", "Remotes")
  if (!section %in% expected_sections) {
    warning(
      "Unexpected section (`", section, "`). Check for typos.",
      call. = FALSE
    )
  }

  section
}

remove_version <- function(x) gsub("\n.*$", "", x)

