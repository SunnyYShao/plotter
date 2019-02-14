library(tidyverse)
library(readxl)
source("color_scheme.R")
dta <- read_csv("color_test.csv")
  plot <- dta %>%
    ggplot(aes(x = group, y = prop, fill = key)) +
    geom_col(width = .7) +
    scale_y_continuous(labels = scales::percent, limits = c(0, 1.1)) +
    hrbrthemes::theme_modern_rc(grid = "", plot_title_size = 32, axis_text_size = 25, caption_size = 12, subtitle_size = 24) +
    labs(
      y = "AAPI Share of Electorate", x = "", fill = "",
      caption = "Source: 2018 Asian American Voter Survey (AAVS) by APIAVote and AAPI Data"
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
    geom_text(family = "Roboto Condensed", fontface = "bold", size = 7, position = position_stack(vjust = 0.5), aes(label = ifelse(prop < .03, NA, scales::percent(prop, 2)))) +
    scale_color_aapidata(palette = "scale", guide = guide_legend(reverse = T)) + # this make sure the legend order match with stacked bar order
    guides(fill = guide_legend(reverse = TRUE)) +
    theme(
      legend.position = "top",
      legend.justification = 0.4,
      legend.text = element_text(size = 18),
      plot.caption = element_text(hjust = .75, vjust = -5))
  
  plot
  # add \n after main title this decrease the spacing between logo and title
  
  # Generating Regular Graphic ----------------------------------------------
  plot_reg <- gridExtra::grid.arrange(
    top = grobTree(
      rectGrob(gp = gpar(fill = "#3F3F3F", col = "#3F3F3F")),
      textGrob(paste(title, "\n", sep = ""), gp = gpar(col = "white", fontface = "bold", family = "Roboto Condensed", fontsize = 32)),
      textGrob(paste("\n\n", question, sep = ""), gp = gpar(cex = .8, col = "white", fontface = "italic", family = "Roboto Condensed", fontsize = 24))
    ),
    plot, padding = unit(3, "cm")
  )
  ggsave(plot_reg,
         filename = paste("infographics_ethnicities/", file, ".png", sep = ""),
         width = 14, height = 7, units = "in", dpi = "retina"
  )
  plot2 <- image_read(paste("infographics_ethnicities/", file, ".png", sep = ""))
  logo_raw <- image_read("~/Dropbox/AAPIData HQ/Projects/opinion database/aapidata-apia-logo-v2.png") # load image in the right directory
  logo <- logo_raw %>%
    image_scale("800x300") %>% # ORIGINAL
    # image_scale("1000x300") %>%
    image_background("#303030", flatten = TRUE) %>%
    image_border("#303030", "1000x40")
  # final_plot <- image_append(image_scale(c(logo,plot2 ), "1400x800"), stack = TRUE)
  final_plot <- image_append(image_scale(c(logo, plot2), "1400x800"), stack = TRUE)
  final_plot <- image_resize(final_plot, "1024x76
                             8")
  image_write(final_plot, path = paste("infographics_ethnicities/", file, ".png", sep = ""))
}