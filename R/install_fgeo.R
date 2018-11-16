# A polite helper for installing packages ---------------------------------

install_fgeo <- function() {
  please_install(needed(cran_dependencies))

  fgeo <- src_pkg(path_src())
  please_install(needed(fgeo), install_from_source)
}

# Author: Hadley Wickham (via http://rstd.io/tidy-tools)
please_install <- function(pkgs, install_fun = install.packages) {
  if (length(pkgs) == 0) {
    return(invisible())
  }
  if (!interactive()) {
    stop("Please run in interactive session", call. = FALSE)
  }

  title <- paste0(
    "Ok to install these packges?\n",
    paste("* ", pkgs, collapse = "\n")
  )
  ok <- menu(c("Yes", "No"), title = title) == 1

  if (!ok) {
    return(invisible())
  }

  install_fun(pkgs)
}

# Adapted from Hadley Wickham (via http://rstd.io/tidy-tools)
needed <- function(pkgs) {
  have <- rownames(installed.packages())
  setdiff(pkgs, have)
}

install_from_source <- function(pkgs) {
  install.packages(pkg_src(pkgs), repos = NULL, type = "source")
}

path_src <- function() {
  # system.file("extdata", path, package = "fgeo.src")
  # FIXME: Replace with the line above
  path <- "inst/extdata/source"
  list.files(path, full.names = TRUE)
}

# Convert source paths to package names
src_pkg <- function(path) {
  gsub(".*(fgeo.*)_.*", "\\1", path)
}

# Convert package names to source paths
pkg_src <- function(pkgs) {
  unlist(lapply(pkgs, grep, path_src(), value = TRUE))
}



clean_raw <- function(raw, include_self, section) {
  if (is.null(raw)) raw <- ""

  pulled <- strsplit(raw, ",")[[1]]
  parsed <- gsub("^\\s+|\\s+$", "", pulled)
  names <- vapply(strsplit(parsed, " +"), "[[", 1, FUN.VALUE = character(1))
  if (section == "Suggests") {
    if (include_self) {
      message("Ignoring argument `ignore_self` (it makes no sense for 'Suggests').")
    }
    return(names)
  }
  if (include_self) {
    names <- c(names, "fgeo")
  }
  if (!is.null(matches)) {
    names <- grep(matches, names, value = TRUE)
  }

  gsub("\n.*", "", names)
}
