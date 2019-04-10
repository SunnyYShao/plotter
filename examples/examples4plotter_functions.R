library(tidyverse)
library(tidycensus)
library(magick)
library(readxl)
library(readr)

source("/Users/sunnyshao/Dropbox/plotter/color_scheme.R")
source("/Users/sunnyshao/Dropbox/plotter/scripts/aapidata_style.R")
source("/Users/sunnyshao/Dropbox/plotter/scripts/finalize_plot.R")
source("/Users/sunnyshao/Dropbox/plotter/scripts/plotter_single_bar.R")


# cleaning the data -----------------------------------------------------------------
dta8 <- read_excel("examples/example.xlsx")
dta8_1 <- dta8 %>% 
  select(group, POP_2017) %>% 
  rename(estimate = POP_2017) %>% 
  filter(!group %in% c("Asian Am AVERAGE", "NHPI AVERAGE","US AVERAGE")) %>% 
  mutate(key = "pop", title = "2017 Population by Detailed AAPI Groups")

# plot --------------------------------------------------------------------

# plotter_single_count <- function(logo_path, label_color, directory, style_function, dta, file_name, color_type, label_size, subtitle, caption)

plotter_single_count("examples/logo_aapidata.png","#ffffff","examples/",aapidata_style, dta8_1, "example.png", "single_dorange", 7, " ", "Source: American Community Survey 2017 1-Year files\n")


