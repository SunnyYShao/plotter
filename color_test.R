library(tidyverse)
library(readxl)
library(grid)
library(gridExtra)
library(magick)
source("color_scheme.R")
# dta <- read_csv("color_test.csv")
dta <- read_csv("/Users/sunnyshao/Dropbox/AAPIData HQ/Projects/2019-2-11 infographic-slides/fb_2017.csv")
dta <- dta %>% filter(graphID == 1)


# plotting ----------------------------------------------------------------


 plot <- dta %>%
    ggplot(aes(x = reorder(race, prop), y = prop, fill = key)) +
    geom_col(width = .7, colour="transparent") +
    scale_y_continuous(labels = scales::percent, limits = c(0, 1.1)) +
    hrbrthemes::theme_modern_rc(grid = "", plot_title_size = 32, axis_text_size = 25, caption_size = 18, subtitle_size = 24) +
    labs(
      y = "AAPI Share of Electorate", x = "", fill = "",
      caption = "Source: Census American Community Survey 2017 1-year file"
    ) +
    theme(
      axis.ticks.length = unit(-1, "cm"),
      axis.ticks = element_blank(),
      legend.position = "top"
    ) +
    theme(
      axis.title.x = element_blank(),
      plot.title = element_text(hjust = 0.5),
      plot.subtitle = element_text(hjust = 0.5),
      axis.text.x = element_blank(),
      axis.ticks.x = element_blank(),
      axis.text.y = element_text(colour = "#dfd8c0", face = "plain"),
      plot.background = element_rect(fill = "#3F3F3F", color = "#3F3F3F"),
      panel.background = element_rect(
        fill = "#3F3F3F",
        colour = "#3F3F3F")) +
    coord_flip() +
    geom_text(family = "Roboto Condensed", colour = "#dfd8c0", fontface = "bold", size = 7, position = position_stack(vjust = 0.5), aes(label = ifelse(prop < .03, NA, scales::percent(prop, 2)))) +
    scale_fill_aapidata(palette = "single_orange", guide = guide_legend(reverse = T)) + # this make sure the legend order match with stacked bar order
    guides(fill = guide_legend(reverse = TRUE)) +
    theme(
      legend.position = "top",
      legend.justification = 0.4,
      legend.text = element_text(size = 18),
      plot.caption = element_text(hjust = .75, vjust = -1))
  
  
  plot_reg <- gridExtra::grid.arrange(
    top = grobTree(
      rectGrob(gp = gpar(fill = "#3F3F3F", col = "#3F3F3F")),
      textGrob(paste(dta$title), gp = gpar(col = "white", fontface = "bold", family = "Roboto Condensed", fontsize = 23))),
    plot, padding = unit(2, "cm")
  )
  ggsave(plot_reg,
         filename = paste("/Users/sunnyshao/Dropbox/AAPIData HQ/Projects/2019-2-11 infographic-slides/", "graph1", ".png", sep = ""),
         width = 14, height = 7, units = "in", dpi = "retina"
  )
  plot2 <- image_read(paste("/Users/sunnyshao/Dropbox/AAPIData HQ/Projects/2019-2-11 infographic-slides/", "graph1", ".png", sep = ""))
  logo_raw <- image_read("~/Dropbox/AAPIData HQ/Projects/2019-2-11 infographic-slides/aapidata-logo-lighter-small.png") # load image in the right directory
  logo <- logo_raw %>%
    image_scale("600x300") %>% # ORIGINAL
    # image_scale("1000x300") %>%
    image_background("#303030", flatten = TRUE) %>%
    image_border("#303030", "1000x40")
  # final_plot <- image_append(image_scale(c(logo,plot2 ), "1400x800"), stack = TRUE)
  final_plot <- image_append(image_scale(c(logo, plot2), "1400x800"), stack = TRUE)
  final_plot <- image_resize(final_plot, "1024x76
                             8")
  image_write(final_plot, path = paste("/Users/sunnyshao/Dropbox/AAPIData HQ/Projects/2019-2-11 infographic-slides/", "graph1", ".png", sep = ""))

  