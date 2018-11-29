#' What you may do after installing fgeo.
#'
#' @description
#' After installing __fgeo__ please visit its
#' [website](https://forestgeo.github.io/fgeo/). If you had any issue during
#' installation, please report it
#' [here](https://github.com/forestgeo/fgeo.install/issues/new) or email me at
#' maurolepore\@gmail.com.
#' @description
#' ```R
#' # Warning: Updating packages may be slow if many packages are behind
#'
#' # Check for uptates
#' update.packages()
#'
#' # Similar but more comprehensive
#' remotes::update_packages()
#'
#' # Best if you already had an old version of fgeo
#' remove.packages("fgeo")
#' fgeo.install::install_fgeo()
#'
#' # Remove all fgeo packages (`fgeo_packages` comes with fgeo.install)
#' remove.packages(fgeo.install::fgeo_packages)
#' ```
#' @name follow_up
NULL
