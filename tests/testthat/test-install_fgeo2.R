context("install_fgeo2")

# This is separate from test-install_fgeo.R bc it's problematic: It passes
# test() but not check().

test_that("with missing dependencies", {
  skip("Passes test() but not check()")

  repos <- "https://cran.rstudio.com/"
  utils::install.packages("writexl", repos = repos)

  utils::remove.packages("writexl")
  on.exit(utils::install.packages("writexl", repos = repos))

  # Avoid error during R CMD check about missing cran mirror.

  expect_output(
    install_fgeo(),
    "install the following.*Expected R environment.*Run.*install.*dependencies()"
  )
  expect_output(
    install_needed_dependencies(repos = repos),
    "Expected R environment.*writexl.*unpacked"
  )
})
