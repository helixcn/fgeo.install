
<!-- README.md is generated from README.Rmd. Please edit that file -->

# fgeo.install

[![Travis build
status](https://travis-ci.org/forestgeo/fgeo.install.svg?branch=master)](https://travis-ci.org/forestgeo/fgeo.install)

**fgeo.install** helps you to install **fgeo**. It guides you to install
the required dependencies from CRAN and then installs **fgeo** packages
from source code.

## Preparation

  - Ensure you have a recent version of R.
  - Ensure you have updated packages (run `update.packages()`).
  - Close all other R sessions.
  - Start a clean R session (click *Session \> Restart R*).

## Installation

1.  Install devtools

<!-- end list -->

``` r
install.packages("devtools")
```

2.  Install **fgeo.install**

<!-- end list -->

``` r
devtools::install_github("forestgeo/fgeo.install")
```

3.  Run `install_fgeo()`

<!-- end list -->

    fgeo.install::install_fgeo()
