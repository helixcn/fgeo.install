context("dependencies")

test_that("retunrs expected dependencies", {
  expect_equal(dependencies("base"), character(0))
  expect_equal(dependencies("grid"), c("grDevices", "utils"))
  expect_equal(dependencies("grid", section = "Suggests"), "lattice")

  expect_equal(
    dependencies(c("stats", "MASS")),
    sort(unique(c(dependencies("stats"), dependencies("MASS"))))
  )

  expect_equal(
    dependencies(c("stats", "MASS"), exclude = "methods"),
    dependencies("stats")
  )

  expect_warning(
    dependencies("stats", NULL, section = c("Imports", "Suggests")),
    "Using"
  )
  expect_silent(dependencies("stats", NULL, section = c("Imports")))

  msg <- "Unexpected section"
  expect_warning(dependencies("grid", section = "suggests"), msg)
})
