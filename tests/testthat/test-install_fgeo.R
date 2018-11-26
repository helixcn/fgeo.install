context("install_fgeo")

repos <- "https://cran.rstudio.com/"

test_that("with all dependencies alrady installed", {
  # Informs cran done; installs fgeo; informs to update
  expect_output(
    install_fgeo(fgeo_source()[[1]]),
    "All CRAN.*installed.*Installing.*source.*check.*updates"
  )

  # Informs cran done
  expect_output(
    install_dependencies(repos = repos),
    "dependencies.*installed."
  )
})

