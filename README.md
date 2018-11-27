
<!-- README.md is generated from README.Rmd. Please edit that file -->

# <img src="https://i.imgur.com/vTLlhbp.png" align="right" height=88 /> fgeo.install

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Travis build
status](https://travis-ci.org/forestgeo/fgeo.install.svg?branch=master)](https://travis-ci.org/forestgeo/fgeo.install)
[![Coverage
status](https://coveralls.io/repos/github/forestgeo/fgeo.install/badge.svg)](https://coveralls.io/r/forestgeo/fgeo.install?branch=master)
[![CRAN
status](https://www.r-pkg.org/badges/version/fgeo.install)](https://cran.r-project.org/package=fgeo.install)

**fgeo.install** helps you to install **fgeo**. Use it to avoid reaching
GitHub’s rate-limit if you lack an authenticated GitHub account (but see
[`usethis::browse_github_pat()`](https://usethis.r-lib.org/reference/browse_github_pat.html)).

## Installation

``` r
install.packages("devtools")
devtools::install_github("forestgeo/fgeo.install")
```

## Usage

    fgeo.install::install_from_github()
    
    # Or
    fgeo.install::install_needed_dependencies()
    fgeo.install::install_fgeo()
