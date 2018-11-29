options(repos = c(CRAN = "https://cran.rstudio.com/"))

context("install_github2")

test_that("Informs if needed packages are installed", {
  expect_output(
    install_github2(),
    "Expected.*environment.*CRAN.*installed.*fgeo.*installed.*follow_up"
  )
})

test_that("Installs missing packages from CRAN and GitHub", {
  # skip("Passes test() but not check()")

  remove.packages(c("writexl", "fgeo.x"))

  todo_and_done <- paste0(
    "Expected.*environment.*",
    "Installing.*CRAN.*CRAN.*installed.*",
    "Installing.*GitHub.*fgeo.*installed.*"
  )
  expect_output(install_github2(), todo_and_done)
})



# Helpers -----------------------------------------------------------------

context("needed")

test_that("outputs packages not already installed", {
  expect_equal(needed("base"), character(0))
  expect_equal(needed("missing1"), "missing1")
  missing_pkgs <- c("missing1", "missing2")
  expect_equal(needed(missing_pkgs), missing_pkgs)
})



context("fgeo_source")

test_that("retuns the expected path", {
  expect_equal(basename(fgeo_source()), scheduled_packages)

  expect_equal(basename(path_source()), "source")
  expect_error(path_source("bad"), "must exist")

  valid_file <- dir(path_source())[[1]]
  expect_equal(basename(path_source(valid_file)), valid_file)
})
