options(repos = c(CRAN = "https://cran.rstudio.com/"))

context("install_cache")

test_that("Informs if needed packages are installed", {
  expect_output(
    install_cache(),
    "Expected.*environment.*CRAN.*installed.*fgeo.*installed.*follow_up"
  )
})

test_that("Installs missing packages from CRAN and GitHub", {
  # skip("Passes test() but not check()")

  remove.packages(c("writexl", "fgeo.x"))

  todo_and_done <- paste0(
    "Expected.*environment.*",
    "Installing.*CRAN.*CRAN.*installed.*",
    "Installing.*cache.*fgeo.*installed.*"
  )
  expect_output(install_cache(), todo_and_done)
})
