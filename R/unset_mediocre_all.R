unset_mediocre_all <- function() {
  ggplot2::theme_set(ggplot2::theme_gray())

  geoms <- c("point", "line", "contour", "text", "curve", "function", "spoke",
             "rug", "errorbar", "errorbarh", "pointrange", "segment", "abline",
             "vline", "hline", "area", "bar", "col", "dotplot", "hex", "tile",
             "boxplot", "density", "violin", "contour_filled", "ribbon",
             "smooth")

  lapply(
    geoms,
    ggplot2::update_geom_defaults,
    list(fill = NULL)
  )

  options(
    ggplot2.discrete.fill = "default",
    ggplot2.discrete.colour = "default",
    ggplot2.continuous.colour = "gradient",
    ggplot2.continuous.fill = "gradient"
  )
}
