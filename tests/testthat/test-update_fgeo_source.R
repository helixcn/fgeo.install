context("update_fgeo_source")

test_that("with one package, builds that package", {
  pkgs <- c("fgeo.x", "fgeo.base")
  tmp <- tempdir()
  on.exit(dir_delete(tmp))

  update_fgeo_source(pkgs, tmp)
  out <- dir_ls(tmp, glob = "*tar.gz")
  pattern <- glue::glue_collapse(pkgs, "|")
  expect_true(all(grepl(pattern, out)))
})
