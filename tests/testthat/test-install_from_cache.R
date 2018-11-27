context("install_from_cache")

test_that("Informs if needed packages are installed", {
  expect_output(
    install_from_cache(),
    "Expected.*environment.*CRAN.*installed.*fgeo.*installed.*update.*packages"
  )
})

test_that("Installs missing packages from CRAN and GitHub", {
  remove.packages(c("writexl", "fgeo.x"))

  todo_and_done <- paste0(
    "Expected.*environment.*",
    "Installing.*CRAN.*CRAN.*installed.*",
    "Installing.*cache.*fgeo.*installed.*"
  )
  expect_output(install_from_cache(), todo_and_done)
})



context("install_from_github")

test_that("Informs if needed packages are installed", {
  expect_output(
    install_from_github(),
    "Expected.*environment.*CRAN.*installed.*fgeo.*installed.*update.*packages"
  )
})

test_that("Installs missing packages from CRAN and GitHub", {
  remove.packages(c("writexl", "fgeo.x"))

  todo_and_done <- paste0(
    "Expected.*environment.*",
    "Installing.*CRAN.*CRAN.*installed.*",
    "Installing.*GitHub.*fgeo.*installed.*"
  )
  expect_output(install_from_github(), todo_and_done)
})

