context("install_fgeo")

test_that("multiplication works", {
  expect_message(install_fgeo(), "already installed")
})
