context("doing")

test_that("Installs multiple packages from a local source", {
  tmp <- tempfile()
  fs::dir_create(tmp)
  .libPaths(tmp)

  pkgs_nm <- fgeo::fgeo_dependencies("fgeo")
  install_fgeo(lib = tmp)

  installed <- fs::path_file(fs::dir_ls(tmp))
  expect_true(all(pkgs_nm %in% installed))
})

