context("build_github")

urls <- c("maurolepore/toy1", "maurolepore/toy2")

test_that("builds source of mulitple packages into a single directory", {
  src <- test_path("source")
  dir_create(src)

  expect_error(build_github(urls, src), NA)

  fs::dir_delete(src)
})

test_that("errs with informative message", {
  pkgs <- fgeo::fgeo_dependencies("fgeo", include_self = FALSE)
  urls <- glue("forestgeo/{pkgs}")
  expect_error(build_github(urls, "tmp2"), "must exist")
})



context("download_github_zip")

test_that("downloads .zip files from owner/repos to destination", {
  zip <- test_path("zip")
  dir_create(zip)

  download_github_zip(urls, zip)
  expect_equal(sum(grepl("toy", dir(zip))), 2)

  fs::dir_delete(zip)
})

