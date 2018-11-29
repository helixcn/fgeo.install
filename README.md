
<!-- README.md is generated from README.Rmd. Please edit that file -->

# <img src="https://i.imgur.com/vTLlhbp.png" align="right" height=88 /> fgeo.install

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/fgeo.install)](https://cran.r-project.org/package=fgeo.install)

**fgeo.install** helps you to install **fgeo**. Use it to avoid reaching
GitHub’s rate-limit if you lack an authenticated GitHub account (but see
[`usethis::browse_github_pat()`](https://usethis.r-lib.org/reference/browse_github_pat.html)).

## Installation

Use **devtools** to install **fgeo.install**; then use **fgeo.install**
to install **fgeo**. You don’t need a GitHub account.

``` r
install.packages("devtools")
devtools::install_github("forestgeo/fgeo.install")

# Install dependencies from CRAN and fgeo packages from GitHub
fgeo.install::install_fgeo()
```
