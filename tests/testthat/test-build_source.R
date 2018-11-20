context("build_source")

test_that("builds source of mulitple packages into a single directory", {
  tmp <- tempdir()
  withr::with_dir(tmp, {
    pkgs <- c("toy1", "toy2")
    usethis::create_package(pkgs[[1]], rstudio = FALSE, open = FALSE)
    usethis::create_package(pkgs[[2]], rstudio = FALSE, open = FALSE)
    build_source(pkgs, "source")

    found <- fs::dir_ls("source", regexp = "[.tar.gz]")
    expect_equal(length(found), 2)

    expected <-  glue::glue_collapse(glue("{pkgs}_0.0.0.9000.tar.gz"), "|")
    output_is_expected <- all(purrr::map_lgl(found, ~grepl(expected, .x)))
    expect_true(output_is_expected)
  })
})
