context("guide_installation")

test_that("outputs the expected instructios", {
  expect_output(
    guide_installation(c("pkg1", "pkg2")),
    "install.*dependencies.*Expected R environment.*Run.*install_dependencies"
  )
})

