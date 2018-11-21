context("check_built_packages")

test_that("packages ready to be installed pass R CMD check cleanly", {
  skip("Takes too long. Run only after `update_fgeo_source()`")

  update_fgeo_source()
  src_dir <- system.file("extdata", "source", package = "fgeo.install")
  out <- check_built_packages(dir_ls(src_dir))
  expect_equal(nrow(out), 0)
})

test_that("with ok packages in a directory, throws no warning", {
  src_pkgs <- dir_ls(test_path("src-ok"))
  expect_warning(
    out <- check_built_packages(src_pkgs),
    NA
  )
  expect_true(identical(nrow(out), 0L))
})

test_that("warns if a package does not pass RCMD cleanly", {
  src_pkgs <- dir_ls(test_path("src-bad"))
  expect_warning(
    out <- check_built_packages(src_pkgs),
    "Some checks must be fixed"
  )

  expect_false(identical(nrow(out), 0L))

  note <- "file.*found at top level.*rcmd-check-should-complain.R"
  expect_true(grepl(note, out$value))

  expect_true(grepl("bad_0.0.0.9000", out$name))
})
