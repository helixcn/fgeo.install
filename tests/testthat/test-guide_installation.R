context("guide_installation")

test_that("outputs the expected instructios", {
  expect_output(
    guide_installation(c("pkg1", "pkg2")),
    "install.*from CRAN.*Start.*clean.*Copy-paste.*run.*code"
  )
})
#'
