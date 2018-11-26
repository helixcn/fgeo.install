
<!-- README.md is generated from README.Rmd. Please edit that file -->

# fgeo.install

[![Travis build
status](https://travis-ci.org/forestgeo/fgeo.install.svg?branch=master)](https://travis-ci.org/forestgeo/fgeo.install)

**fgeo.install** helps you to install **fgeo**. Use it to avoid reaching
GitHub’s rate-limit if you lack an authenticated GitHub account (but see
[`usethis::browse_github_pat()`](https://usethis.r-lib.org/reference/browse_github_pat.html)).

## Installation

``` r
install.packages("devtools")
devtools::install_github("forestgeo/fgeo.install")
```

## Usage

    fgeo.install::install_dependencies()
    fgeo.install::install_fgeo()
