context("doing")

test_that("Installs multiple packages from a local source", {
  skip(
    "FIXME: Errs with message 'trying to use CRAN without setting a mirror'
    but `repos = TRUE`. Same with install.packages() and remotes::install_local()"
  )

  tmp <- tempfile()
  fs::dir_create(tmp)
  .libPaths(tmp)

  pkgs_nm <- fgeo::fgeo_dependencies("fgeo")
  expect_error(install_fgeo(), NA)
})

