options(repos = c(CRAN = "https://cran.rstudio.com/"))

context("install_fgeo")

test_that("Informs if needed packages are installed", {
  expect_output(
    install_fgeo(),
    "Expected.*environment.*CRAN.*installed.*fgeo.*installed.*follow_up"
  )
})

test_that("Installs missing packages from CRAN and GitHub", {
   skip("Passes test() but not check()")

  remove.packages(c("lubridate", "fgeo.x"))

  todo_and_done <- paste0(
    "Expected.*environment.*",
    "Installing.*CRAN.*CRAN.*installed.*",
    "Installing.*GitHub.*fgeo.*installed.*"
  )
  expect_output(install_fgeo(), todo_and_done)
})

test_that("Accepts argument `ref`", {
   skip("Passes test() but not check()")
  remove.packages("fgeo.x")
  expect_error(
    # May warn if "dev" doesn't exist
    suppressWarnings(install_fgeo("dev")),
    NA
  )
})

test_that("Accepts argument `ref`", {
   skip("Passes test() but not check()")
  remove.packages("fgeo.x")
  expect_warning(install_fgeo("bad"), "bad failed.*Trying.*master")
})

test_that("Accepts argument `ref`", {
   skip("Passes test() but not check()")
  remove.packages(c("fgeo.x", "fgeo"))
  expect_warning(install_fgeo("bad"), "bad failed.*Trying.*master")
})






# Helpers -----------------------------------------------------------------

context("needed")

test_that("outputs packages not already installed", {
  expect_equal(needed("base"), character(0))
  expect_equal(needed("missing1"), "missing1")
  missing_pkgs <- c("missing1", "missing2")
  expect_equal(needed(missing_pkgs), missing_pkgs)
})

