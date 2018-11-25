context("install_fgeo")

install_if_needed <- function(pkgs) {
  if (!identical(needed(pkgs), character(0))) {
    utils::install.packages(pkgs)
  }

  invisible()
}

teardown(install_if_needed("writexl"))

test_that("Installs one package and gives expected instructions", {
  skip("Errs on R CMD check but OK otherwise")

  utils::remove.packages("writexl")
  expect_output(install_fgeo(), "install.packages.*writexl.*)")

  install.packages("writexl", repos = c(CRAN = "https://cran.rstudio.com/"))
  expect_output(
    install_fgeo(fgeo_source()[[1]]),
    "All CRAN.*installed.*Installing.*source.*check.*updates"
  )
})

