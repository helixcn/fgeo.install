context("dependencies")

test_that("retunrs expected dependencies", {
  expect_equal(dependencies("base"), character(0))
  expect_equal(dependencies("grid"), c("grDevices", "utils"))
  expect_equal(dependencies("grid", section = "Suggests"), "lattice")

  msg <- "Unexpected section"
  expect_warning(dependencies("grid", section = "suggests"), msg)
})
