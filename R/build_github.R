#' Build source package from source code in a GitHub repository.
#'
#' @param urls Character vector giving GitHub repositories with the
#'   format "owner/repo".
#' @param path Length-1 character vector; path to directory where to save the
#'   output.
#' @param ... Arguments passed to [devtools::build()].
#'
#' @return
#'   * `download_github_zip()` outputs .zip files.
#'   * `build_github()` outputs source-package files (.tar.gz).
#' @export
#'
#' @examples
#' \dontrun{
#' urls <- c("maurolepore/toy1", "maurolepore/toy2")
#' tmp <- tempdir()
#'
#' download_github_zip(urls, tmp)
#' fs::dir_ls(tmp, glob = "*.zip")
#'
#' build_github(urls, tmp)
#' fs::dir_ls(tmp, glob = "*.tar.gz")
#'
#' }
build_github <- function(urls, path = NULL, ...) {
  # From GitHub to .zip
  tmp <- tempfile()
  zip_dir <- glue("{tmp}/zip")
  fs::dir_create(zip_dir)
  download_github_zip(urls, zip_dir)

  # Unzip
  src_dir <- glue("{tmp}/src")
  zip_files <- fs::dir_ls(zip_dir)
  purrr::walk(zip_files, utils::unzip, exdir = src_dir)

  # From source code to source package
  purrr::walk2(
    fs::dir_ls(src_dir), path %||% ".",
    devtools::build
  )
}

#' @export
#' @rdname build_github
download_github_zip <- function(urls, src) {
  .urls <- glue("https://github.com/{urls}/archive/master.zip")

  if (!fs::dir_exists(src)) fs::dir_create(src)
  .urls <- glue("https://github.com/{urls}/archive/master.zip")

  repos <- gsub(".*/(.*)$", "\\1", urls)
  .src <- glue("{src}/{repos}.zip")
  purrr::walk2(.urls, .src, utils::download.file)
}

