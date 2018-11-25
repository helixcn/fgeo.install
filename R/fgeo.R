#' fgeo packages.
#'
#' Simpler version of `fgeo::fgeo()`.
#'
#' @param include_self Logical. `FALSE` excludes "fgeo".
#'
#' @return Character vector.
#' @export
#'
#' @examples
#' fgeo()
#' fgeo(FALSE)
fgeo <- function(include_self = TRUE) {
  fgeo_dependencies(
    matches = "fgeo", include_self = include_self, section = "Imports"
  )
}

fgeo_dependencies <- function(matches = NULL,
                              include_self = TRUE,
                              section = c("Imports", "Suggests")) {
  section <- section[[1]]
  raw <- utils::packageDescription("fgeo")[[section]]
  pulled <- strsplit(raw, ",")[[1]]
  parsed <- gsub("^\\s+|\\s+$", "", pulled)
  names <- vapply(strsplit(parsed, " +"), "[[", 1, FUN.VALUE = character(1))

  if (section == "Suggests") {
    if (include_self) {
      message(
        "Ignoring argument `ignore_self` (it makes no sense for 'Suggests')."
      )
    }
    return(names)
  }

  if (include_self) {
    names <- c(names, "fgeo")
  }

  if (!is.null(matches)) {
    names <- grep(matches, names, value = TRUE)
  }

  names
}
