#' Move to fgeo: All packages must be installed.
#' @author Adapted from tidyverse::tidyverse_update()
#' @noRd
NULL
update_cran_dependencies <- function() {
  behind <- dplyr::filter(deps_behind(), behind)

  if (nrow(behind) == 0) {
    cli::cat_line("All dependencies are up-to-date.")
    return(invisible())
  }

  guide_installation(
    behind$package,
    "The following packages are out-of-date:",
    bullets = cli::cat_bullet(
      format(behind$package), " (", behind$local, " -> ", behind$cran, ")"
    )
  )

  invisible()
}

#' @author Adapted from tidyverse::tidyverse_deps()
NULL
deps_behind <- function() {
  cbind(deps_cran(), deps_local())
}

deps_cran <- function() {
  fgeo_pkgs <- fgeo::fgeo_dependencies("fgeo")
  deps <- list(fgeo = dependencies(fgeo_pkgs, exclude = "fgeo"))
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

deps_local <- function() {
  local_version <- lapply(deps_cran()$package, utils::packageVersion)
  behind <- purrr::map2_lgl(deps_cran()$cran, local_version, `>`)

  tibble::tibble(
    local = local_version %>% purrr::map_chr(as.character),
    behind = behind
  )
}
