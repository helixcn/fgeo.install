fgeo_dependencies <- function(include_self = TRUE,
                              section = c("Imports", "Suggests")) {

  section <- section[[1]]

  fgeo_pkgs <- fgeo.install:::src_pkg(fgeo.install:::src_paths())
  raws <- lapply(fgeo_pkgs, function(x) utils::packageDescription(x)[[section]])

  ok <- !vapply(raws, is.null, logical(1))
  deps <- lapply(
    raws[ok],
    clean_raw, include_self = include_self, section = section
  )

  unique(Reduce(c, deps))
}

clean_raw <- function(raw, include_self, section) {
  if (is.null(raw)) raw <- ""

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

  gsub("\n.*", "", names)
}



cran_dependencies <-
  grep("fgeo", fgeo_dependencies(), value = TRUE, invert = TRUE)

use_data(
  cran_dependencies,
  internal = TRUE,
  overwrite = TRUE
)
