#' @author Adapted from tidyverse::tidyverse_update()
NULL
fgeo_update_cran <- function() {
  behind <- dplyr::filter(fgeo_deps(), behind)
  if (nrow(behind) == 0) {
    cli::cat_line("All CRAN fgeo-dependencies up-to-date")
    return(invisible())
  }

  cli::cat_line("The following CRAN packages are out of date:")
  cli::cat_line()
  cli::cat_bullet(format(behind$package), " (", behind$local,
    " -> ", behind$cran, ")")
  cli::cat_line()
  cli::cat_line("Click 'Session > Restart R' then run:")

  pkg_str <- paste0(deparse(behind$package), collapse = "\n")
  cli::cat_line("install.packages(", pkg_str, ")")

  invisible()
}

#' @author Adapted from tidyverse::tidyverse_deps()
NULL
fgeo_deps_behind <- function() {
  cbind(fgeo_deps_cran(), fgeo_deps_local())
}

fgeo_deps_cran <- function() {
  fgeo_pkgs <- fgeo::fgeo_dependencies("fgeo")
  deps <- list(fgeo = fgeo.install::dependencies(fgeo_pkgs, exclude = "fgeo"))
  pkg_deps <- unique(sort(unlist(deps)))

  base_pkgs <- c("base", "compiler", "datasets", "graphics",
    "grDevices", "grid", "methods", "parallel", "splines",
    "stats", "stats4", "tools", "tcltk", "utils")

  pkg_deps <- setdiff(pkg_deps, base_pkgs)

  pkgs <- utils::available.packages()
  cran_version <- lapply(pkgs[pkg_deps, "Version"], base::package_version)

  tibble::tibble(
    package = pkg_deps,
    cran = cran_version %>% purrr::map_chr(as.character)
  )
}

fgeo_deps_local <- function() {
  local_version <- lapply(fgeo_deps_cran()$package, utils::packageVersion)
  behind <- purrr::map2_lgl(fgeo_deps_cran()$cran, local_version, `>`)

  tibble::tibble(
    local = local_version %>% purrr::map_chr(as.character),
    behind = behind
  )
}
