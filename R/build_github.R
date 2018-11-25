#' Build source package from source code in a GitHub repository.
#'
#' @param urls Character vector giving GitHub repositories with the
#'   format "owner/repo".
#' @param destdir Length-1 character vector; path to directory where to save the
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
#' }
build_github <- function(urls, destdir = ".") {
  if (!dir_exists(destdir)) abort("`destdir` must exist.")

  # From GitHub to .zip
  tmp <- tempfile()
  on.exit(dir_delete(tmp))

  zip_dir <- glue("{tmp}/zip")
  dir_create(zip_dir)
  download_github_zip(urls, zip_dir)

  # Unzip
  src_unzip_dir <- glue("{tmp}/src/unzip")
  zip_files <- dir_ls(zip_dir)
  walk(zip_files, utils::unzip, exdir = src_unzip_dir)

  # From source code to source package
  walk(dir_ls(src_unzip_dir), pkgbuild::build)

  built_paths <- dir_ls(src_unzip_dir, glob = "*.tar.gz")
  destdir_paths <- fs::path(destdir, fs::path_file(built_paths))
  fs::file_move(built_paths, destdir_paths)

}

#' @export
#' @rdname build_github
download_github_zip <- function(urls, destdir) {
  .urls <- glue("https://github.com/{urls}/archive/master.zip")

  if (!dir_exists(destdir)) dir_create(destdir)
  .urls <- glue("https://github.com/{urls}/archive/master.zip")

  repos <- gsub(".*/(.*)$", "\\1", urls)
  .src <- glue("{destdir}/{repos}.zip")
  walk2(.urls, .src, utils::download.file)
}

