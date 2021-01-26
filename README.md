
<!-- README.md is generated from README.Rmd. Please edit that file -->

# mediocrethemes

<!-- badges: start -->

<!-- badges: end -->

This package provides not particularly nice and, hopefully, not
particularly ugly ggplot themes.

## Installation

You can install the development version of `mediocrethemes` from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
# devtools::install_github("vincentbagilet/mediocrethemes")
```

Note that you may need to restart your R session once the installation
is complete to be able to use the package.

## Usage

This package provides both a ggplot theme and a color palette. Users can
set the theme and color palette independently.

``` r
library(ggplot2)
library(mediocrethemes)

ggplot(data = ggplot2::mpg, aes(x = cty, y = displ)) +
    geom_point() +
    theme_mediocre() +
    scale_mediocre_d() +
    labs(title = "A very nice title", subtitle = "A disappointing subtitle")
```

<img src="man/figures/README-base_graph-1.png" width="70%" style="display: block; margin: auto;" />

Users can also set the theme and color palette for all plots in a
document with the function `set_mediocre_all` placed at the top of their
document:

``` r
set_mediocre_all()

ggplot(data = ggplot2::mpg, aes(x = cty, y = displ, fill = manufacturer)) +
    geom_col() +
    labs(title = "A very nice title", subtitle = "A disappointing subtitle")
```

<img src="man/figures/README-set_mediocre_all-1.png" width="70%" style="display: block; margin: auto;" />

## Examples

### General examples

A couple of example plots obtained with this theme:

<img src="man/figures/README-examples-1.png" width="70%" style="display: block; margin: auto;" /><img src="man/figures/README-examples-2.png" width="70%" style="display: block; margin: auto;" /><img src="man/figures/README-examples-3.png" width="70%" style="display: block; margin: auto;" />

    #> `geom_smooth()` using method = 'loess' and formula 'y ~ x'

<img src="man/figures/README-examples-4.png" width="70%" style="display: block; margin: auto;" /><img src="man/figures/README-examples-5.png" width="70%" style="display: block; margin: auto;" /><img src="man/figures/README-examples-6.png" width="70%" style="display: block; margin: auto;" /><img src="man/figures/README-examples-7.png" width="70%" style="display: block; margin: auto;" />

### Setting a background

You can also easily set a background for all their plots by setting the
parameter `background` of the functions `theme_mediocre` or
`set_mediocre_all` to `TRUE`. The color of the background is predefined
to fit nicely the theme palette. One can of course still modify the
background color by adding a layer to the ggplot theme:
`theme(plot.background = element_rect(fill = "red"))`.

``` r
set_mediocre_all(background = TRUE)

ggplot(data = ggplot2::mpg, aes(x = cty, y = displ)) +
    geom_point() +
    labs(title = "A very nice title", subtitle = "A disappointing subtitle")
```

<img src="man/figures/README-background-1.png" width="70%" style="display: block; margin: auto;" />

### Additional palettes

Notes that additional palettes are available.

#### Rainbow

<img src="man/figures/README-rainbow-1.png" width="70%" style="display: block; margin: auto;" /><img src="man/figures/README-rainbow-2.png" width="70%" style="display: block; margin: auto;" /><img src="man/figures/README-rainbow-3.png" width="70%" style="display: block; margin: auto;" /><img src="man/figures/README-rainbow-4.png" width="70%" style="display: block; margin: auto;" /><img src="man/figures/README-rainbow-5.png" width="70%" style="display: block; margin: auto;" />

#### Green

<img src="man/figures/README-green-1.png" width="70%" style="display: block; margin: auto;" /><img src="man/figures/README-green-2.png" width="70%" style="display: block; margin: auto;" /><img src="man/figures/README-green-3.png" width="70%" style="display: block; margin: auto;" /><img src="man/figures/README-green-4.png" width="70%" style="display: block; margin: auto;" /><img src="man/figures/README-green-5.png" width="70%" style="display: block; margin: auto;" />
