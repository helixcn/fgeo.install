context("doing")

test_that("Installs multiple packages from CRAN", {
  pkgs <- c("io", "clipr")
  remove.packages(pkgs)
  out <- capture_output(install_these(pkgs))
  expect_true(grepl("package.*io.*successfully unpacked", out))
  expect_true(grepl("package.*clipr.*successfully unpacked", out))
})

