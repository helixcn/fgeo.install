context("build_github")

urls <- c("maurolepore/toy1", "maurolepore/toy2")

test_that("builds source of mulitple packages into a single directory", {
  src <- test_path("source")
  fs::dir_create(src)

  expect_error(build_github(urls, src), NA)

  fs::dir_delete(src)
})



context("download_github_zip")

test_that("downloads .zip files from owner/repos to destination", {
  zip <- test_path("zip")
  fs::dir_create(zip)

  download_github_zip(urls, zip)
  expect_equal(sum(grepl("toy", dir(zip))), 2)

  fs::dir_delete(zip)
})



context("build_local")

test_that("builds source of mulitple packages into a single directory", {
  pkgs <- c("toy1", "toy2")
  pkgs_path <- purrr::map_chr(pkgs, test_path)
  src_path <- test_path("source")

  build_local(pkgs_path, src_path)

  found <- fs::dir_ls(src_path, regexp = "[.tar.gz]")
  expect_equal(length(found), 2)

  expected <-  glue::glue_collapse(glue("{pkgs}_0.0.0.9000.tar.gz"), "|")
  output_is_expected <- all(purrr::map_lgl(found, ~grepl(expected, .x)))
  expect_true(output_is_expected)

  fs::dir_delete(src_path)
})
