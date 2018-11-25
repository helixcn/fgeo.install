context("prefix")

test_that("with simple packages-vector, schedules packages as planned", {
  pkgs <- c("fgeo.base", "fgeo.x")

  plan <- c(
    "01" = "fgeo.x",
    "02" = "fgeo.base"
  )
  expect_equal(schedule(pkgs, plan)[1], "fgeo.x")
  expect_equal(schedule(pkgs, plan)[2], "fgeo.base")

  plan <- c(
    "02" = "fgeo.x",
    "01" = "fgeo.base"
  )
  expect_equal(schedule(pkgs, plan)[2], "fgeo.x")
  expect_equal(schedule(pkgs, plan)[1], "fgeo.base")
})

test_that("with complex vector, schedules as planned", {
  pkgs <- c("-fgeo.base_", "-fgeo.x_")

  plan <- c(
    "01" = "fgeo.x",
    "02" = "fgeo.base"
  )
  expect_equal(schedule(pkgs, plan)[1], "-fgeo.x_")
  expect_equal(schedule(pkgs, plan)[2], "-fgeo.base_")
})
