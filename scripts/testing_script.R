library(tidyverse)
library(tidycensus)
library(magick)
source("scripts/aapidata_style.R")
source("scripts/finalize_plot.R")

# test_dta <- get_acs(geography = "state",variables = "B02018_001",year = 2017)
# 
test_plot <- test_dta %>%
  top_n(10,wt = estimate) %>%
  select(NAME, estimate, moe) %>%
  ggplot(aes(x = reorder(NAME,estimate), y = estimate))+
  geom_bar(stat="identity")+
  # geom_pointrange(aes(ymin=estimate-moe, ymax = estimate + moe))+
  coord_flip()+
  scale_y_continuous(labels=scales::comma)+
  geom_text(aes(label= scales::comma(estimate)),size=7, color = "white",nudge_y =300000)+
  aapidata_style()+
  labs(title = "\nTest Title",subtitle = "This is a subtitle")
#   
# test_plot

finalise_plot(plot_name = test_plot,
              source_name = "test2",width_pixels = 1400, height_pixels = 800,
              logo_image_path = "dta/aapidata-logo-lighter.png",
              save_filepath = "~/Dropbox/Shared/AAPIData HQ/Projects/2019-AARP-APIAVOTE-report/test38.png")
              # save_filepath = "dta/test.png")




