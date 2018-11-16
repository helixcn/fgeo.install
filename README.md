
<!-- README.md is generated from README.Rmd. Please edit that file -->

# fgeo.install

**fgeo.install** helps you to install **fgeo**. It installs the missing
dependencies from CRAN and **fgeo** packages from source code.

1.  Ensure you have a recent version of R.

2.  Ensure you have updated packages (see `?update.packages()`).

3.  Install devtools.

<!-- end list -->

``` r
install.packages("devtools")
```

4.  Install **fgeo.install**.

<!-- end list -->

``` r
devtools::install_github("forestgeo/fgeo.install")
```

5.  Install missing dependencies and **fgeo**.

<!-- end list -->

    fgeo.install::install_fgeo()
