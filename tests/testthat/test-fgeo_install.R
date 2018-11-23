context("fgeo_install")



test_that("errs with informative message", {
  expect_error(install_these(), "is missing.*no default")
})

test_that("Outputs invisible `pkgs`", {
  out <- install_these("base")
  expect_equal(out, "base")
})

test_that("Informs if required packages are already installed", {
  expect_message(
    install_these("base", .f = utils::install.packages),
    "packages.*already.*installed"
  )
})

test_that("Installs multiple packages from a local source", {
  tmp <- tempfile()
  fs::dir_create(tmp)
  .libPaths(tmp)
  expect_true(is.null(installed(tmp)))

  pkgs_nm <- c("toy1", "toy2")
  pkgs <- purrr::map_chr(pkgs_nm, test_path)

  install_these(pkgs, .f = devtools::install_local, lib = tmp)
  expect_equal(installed(tmp), pkgs_nm)
})



context("needed")

test_that("outputs packages not already installed", {
  expect_equal(needed("base"), character(0))
  expect_equal(needed("missing1"), "missing1")
  missing_pkgs <- c("missing1", "missing2")
  expect_equal(needed(missing_pkgs), missing_pkgs)
})

