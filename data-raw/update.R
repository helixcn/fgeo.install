# TODO:
# * Read remotes
# * Avoid installing via Import because may fail
#   (https://github.com/tidyverse/tidyverse/issues/70). Safest to keep installing
#   directly from CRAN with install.packages() or remotes::some-function.
# * Tests may use test_lib library with .libPaths(test_lib) (e.g.
#   https://github.com/tidyverse/tidyverse/issues/70#issue-250011959
#   Hadly: https://github.com/tidyverse/tidyverse/issues/70#issuecomment-342554422
#   )
#   At the end, simply fs::dir_delete(test_lib)
# * Allow building binary packages and create binary dir from .Platform$OS.type
# * Create direcory in inst/extdata if it doesnt' exist
# * Test taht all packages in inst/extdata pass R CMD cleanly. Use
#   rcmdcheck::rcmdcheck().
#     * expect_equall(x$errors, character(0))
#     * expect_equall(x$warnings, character(0))
#     * expect_equall(x$notes, character(0))
# * Move R/ to fgeo and data-raw to R/ so this becomes a developer package to
#   build source and binary code inside fgeo. That will allow to test code that
#   is not in data-raw

# rename_filenames_by_installation_order() should take an ordered vector of
# package names: c("fgeo.x", "fgeo.base", ...) and do the rest of the magic
# inside the function.

update_dependencies <- function() source("data-raw/dependencies.R")

update_build <- function() {
  fs::file_delete(fgeo.install:::src_paths())

  source("data-raw/build.R")

  rename_filenames_by_installation_order()
}

rename_filenames_by_installation_order <- function() {
  pattern_replacement <- c(
    "fgeo.x_"    = "01-fgeo.x_",
    "fgeo.base_" = "02-fgeo.base_",
    "fgeo.ctfs_" = "03-fgeo.ctfs_",
    "fgeo.tool_" = "04-fgeo.tool_",
    "fgeo.map_"  = "05-fgeo.map_",
    "fgeo_"      = "zz-fgeo_"
  )

  path <- fgeo.install:::src_paths()
  new_path <- stringr::str_replace_all(path, pattern_replacement)
  fs::file_move(path, new_path)
}


# Run -------------------------------------------------------------------

update_dependencies()
update_build()
