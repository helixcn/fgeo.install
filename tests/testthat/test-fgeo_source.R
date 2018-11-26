context("fgeo_source")

test_that("retuns the expected path", {
  expect_equal(basename(fgeo_source()), scheduled_packages)

  expect_equal(basename(path_source()), "source")
  expect_error(path_source("bad"), "must exist")

  valid_file <- dir(path_source())[[1]]
  expect_equal(basename(path_source(valid_file)), valid_file)
})
