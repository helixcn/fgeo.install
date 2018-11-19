context("build_source")

test_that("builds source of mulitple packages into a single directory", {
  withr::with_dir(getwd(), {
    tmp <- tempdir()
    pkgs <- c("./toy1", "./toy2")

    setwd(tmp)
    usethis::create_package(pkgs[[1]], rstudio = FALSE, open = FALSE)
    setwd(pkgs[[1]])
    git2r::init()
    git2r::add(".", dir())
    git2r::commit(".", "Commit all.")
    setwd(tmp)

    usethis::create_package(pkgs[[2]], rstudio = FALSE, open = FALSE)
    setwd(pkgs[[2]])
    git2r::init()
    git2r::add(".", dir())
    git2r::commit(".", "Commit all.")
    setwd(tmp)

    x <- purrr::quietly(build_source)(pkgs, fs::path(tmp, "source"))

    found <- fs::dir_ls("source", regexp = "[.tar.gz]")
    expect_equal(length(found), 2)

    informs_branch <- all(grepl("master", x$messages))
    expect_true(informs_branch)
  })
})
