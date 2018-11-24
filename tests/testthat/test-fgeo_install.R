context("fgeo_install")

test_that("errs with informative message", {
  expect_error(install_these(), "is missing.*no default")
})

test_that("Installs multiple packages from a local source", {
  tmp <- tempfile()
  fs::dir_create(tmp)
  .libPaths(tmp)

  pkgs_nm <- c("toy1", "toy2")
  pkgs <- purrr::map_chr(pkgs_nm, test_path)

  remotes::install_local(pkgs, lib = tmp)
  expect_equal(fs::path_file(fs::dir_ls(tmp)), pkgs_nm)
})



context("needed")

test_that("outputs packages not already installed", {
  expect_equal(needed("base"), character(0))
  expect_equal(needed("missing1"), "missing1")
  missing_pkgs <- c("missing1", "missing2")
  expect_equal(needed(missing_pkgs), missing_pkgs)
})

