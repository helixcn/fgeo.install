context("install_fgeo2")

# This is separate from test-install_fgeo.R to insulate setup() and teardown()

# Avoid error during R CMD check about missing cran mirror.
repos <- "https://cran.rstudio.com/"
setup(utils::remove.packages("writexl"))
teardown(
  utils::install.packages("writexl", repos = repos)
)

test_that("with missing dependencies", {
  skip("Passes test() but not check()")

  expect_output(install_fgeo(), "install.packages.*writexl")
  expect_output(
    install_dependencies(repos = repos),
    "writexl.*unpacked"
  )
})
