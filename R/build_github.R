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
#' dir_ls(tmp, glob = "*.zip")
#'
#' build_github(urls, tmp)
#' dir_ls(tmp, glob = "*.tar.gz")
#' }
build_github <- function(urls, destdir = ".", ...) {
  if (!dir_exists(destdir)) abort("`destdir` must exist.")

  # From GitHub to .zip
  tmp <- tempfile()
  zip_dir <- glue("{tmp}/zip")
  dir_create(zip_dir)
  download_github_zip(urls, zip_dir)

  # Unzip
  src_dir <- glue("{tmp}/src")
  zip_files <- dir_ls(zip_dir)
  walk(zip_files, utils::unzip, exdir = src_dir)

  # From source code to source package
  .path <- glue("{destdir}/{dir(src_dir)}.tar.gz")
  walk2(dir_ls(src_dir), .path, pkgbuild::build, ...)
}

#' @export
#' @rdname build_github
download_github_zip <- function(urls, src) {
  .urls <- glue("https://github.com/{urls}/archive/master.zip")

  if (!dir_exists(src)) dir_create(src)
  .urls <- glue("https://github.com/{urls}/archive/master.zip")

  repos <- gsub(".*/(.*)$", "\\1", urls)
  .src <- glue("{src}/{repos}.zip")
  walk2(.urls, .src, utils::download.file)
}

