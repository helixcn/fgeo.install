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

  remove.packages(c("writexl", "fgeo.x"))

  todo_and_done <- paste0(
    "Expected.*environment.*",
    "Installing.*CRAN.*CRAN.*installed.*",
    "Installing.*GitHub.*fgeo.*installed.*"
  )
  expect_output(install_fgeo(), todo_and_done)
})



# Helpers -----------------------------------------------------------------

context("needed")

test_that("outputs packages not already installed", {
  expect_equal(needed("base"), character(0))
  expect_equal(needed("missing1"), "missing1")
  missing_pkgs <- c("missing1", "missing2")
  expect_equal(needed(missing_pkgs), missing_pkgs)
})

