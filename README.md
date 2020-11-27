
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

## Usage

This package provides both a ggplot theme and a color palette. Users can
set the theme and color palatette..

``` r
library(ggplot2)
library(mediocrethemes)

ggplot(data = ggplot2::mpg, aes(x = cty, y = displ)) +
    geom_point() +
    theme_mediocre() +
    scale_mediocre_d() +
    labs(title = "A very nice title", subtitle = "A disapointing subtitle")
```

<img src="man/figures/README-base_graph-1.png" width="70%" style="display: block; margin: auto;" />

Users can set the theme and color palette for all plots in a document by
using the function `set_mediocre_all` at the top of their document:

``` r
set_mediocre_all()

ggplot(data = ggplot2::mpg, aes(x = cty, y = displ, fill = manufacturer)) +
    geom_col() +
    labs(title = "A very nice title", subtitle = "A disapointing subtitle")
```

<img src="man/figures/README-set_mediocre_all-1.png" width="70%" style="display: block; margin: auto;" />

## Examples

### General examples

Here are a couple of example plots obtained with this theme.

``` r
ggplot(data = ggplot2::mpg, aes(x = cty, y = displ)) +
    geom_col() +
    labs(title = "A very nice title", subtitle = "A disapointing subtitle")
```

<img src="man/figures/README-examples-1.png" width="70%" style="display: block; margin: auto;" />

``` r

ggplot(data = ggplot2::mpg, aes(x = cty, y = displ, fill = drv)) +
  geom_col() +
  labs(title = "A very nice title", subtitle = "A disapointing subtitle")
```

<img src="man/figures/README-examples-2.png" width="70%" style="display: block; margin: auto;" />

``` r

ggplot(data = ggplot2::mpg, aes(x = cty, y = displ)) +
  geom_point() +
  geom_smooth() +
  labs(title = "A very nice title", subtitle = "A disapointing subtitle")
#> `geom_smooth()` using method = 'loess' and formula 'y ~ x'
```

<img src="man/figures/README-examples-3.png" width="70%" style="display: block; margin: auto;" />

``` r

ggplot(data = ggplot2::mpg, aes(x = cty)) +
    geom_density() +
    labs(title = "A very nice title", subtitle = "A disapointing subtitle")
```

<img src="man/figures/README-examples-4.png" width="70%" style="display: block; margin: auto;" />

``` r

df <- data.frame(
  x = rnorm(10000),
  y = rnorm(10000)
)

ggplot(df, aes(x, y)) +
  geom_hex() +
  coord_fixed() +
  labs(title = "A very nice title", subtitle = "A disapointing subtitle")
```

<img src="man/figures/README-examples-5.png" width="70%" style="display: block; margin: auto;" />

``` r

ggplot(data = ggplot2::mpg, aes(x = cty, y = displ)) +
  geom_point() +
  facet_wrap(~ year) +
  theme_mediocre() +
  labs(title = "A very nice title", subtitle = "A disapointing subtitle") 
```

<img src="man/figures/README-examples-6.png" width="70%" style="display: block; margin: auto;" />

### Setting a background

One can also easily det a background for all their plots by setting the
parameter `background` of the functions `theme_mediocre` or
`set_mediocre_all` to `TRUE`. The color of the background is predefined
to fit nicely the theme palette. One can of course still modify the
background color by adding a layer to the ggplot theme:
`theme(plot.background = element_rect(fill = "red"))`.

``` r
set_mediocre_all(background = TRUE)

ggplot(data = ggplot2::mpg, aes(x = cty, y = displ)) +
    geom_point() +
    labs(title = "A very nice title", subtitle = "A disapointing subtitle")
```

<img src="man/figures/README-background-1.png" width="70%" style="display: block; margin: auto;" />
