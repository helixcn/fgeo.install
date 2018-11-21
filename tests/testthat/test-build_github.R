context("build_github")

urls <- c("maurolepore/toy1", "maurolepore/toy2")

test_that("builds source of mulitple packages into a single directory", {
  destdir <- test_path("source")
  dir_create(destdir)

  # Throws no error during build
  expect_error(build_github(urls, destdir), NA)
  # Throws no error during check
  expect_error(devtools::check_built(dir_ls(destdir)[[1]]), NA)

  fs::dir_delete(destdir)
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

