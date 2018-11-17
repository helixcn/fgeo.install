
<!-- README.md is generated from README.Rmd. Please edit that file -->

# fgeo.install

**fgeo.install** helps you to install **fgeo**. It installs the missing
dependencies from CRAN and **fgeo** packages from source code.

<details>

<summary><strong>Advice before you install</strong></summary>

<p>

  - Ensure you have a recent version of R.

  - Ensure you have updated packages (run `update.packages()`).

  - Close all other R sessions.

  - Restart R (go to *Session \> Restart R*).

</p>

</details>

1.  Install devtools.

<!-- end list -->

``` r
install.packages("devtools")
```

2.  Install **fgeo.install**.

<!-- end list -->

``` r
devtools::install_github("forestgeo/fgeo.install")
```

3.  Run `install_fgeo()`

<!-- end list -->

    fgeo.install::install_fgeo()
