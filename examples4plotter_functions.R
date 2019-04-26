library(tidyverse)
library(tidycensus)
library(magick)
library(readxl)
library(readr)

source("color_scheme.R")
source("scripts/aapidata_style.R")
source("scripts/finalize_plot.R")
source("scripts/plotter_single_bar.R")


# cleaning the data -----------------------------------------------------------------
## 1. load the data
dta <- read_excel("examples/example.xlsx")

##2. make sure the final data has four columns in the order of group, estimate, key, title

#clean data for single bar graph count
single_bar_count <- dta %>% 
  select(group, POP_2017) %>% 
  rename(estimate = POP_2017) %>% 
  filter(!group %in% c("Asian Am AVERAGE", "NHPI AVERAGE","US AVERAGE")) %>% 
  mutate(key = "pop", title = "2017 Population by Detailed AAPI Groups")

#clean data for single bar graph percent - data is [0,1]
single_bar_pct <- dta %>% 
  select(group, growth_00_17) %>% 
  rename(estimate = growth_00_17) %>% 
  filter(!group %in% c("Asian Am AVERAGE", "NHPI AVERAGE","US AVERAGE"),
         estimate <= 1 & estimate >=0) %>% 
  mutate(key = "growth", title = "2010-2017 Population Growth by Detailed AAPI Groups")

#clean data for single bar graph percent - data can be > 1 or < 0
single_bar_pct_unlim <- dta %>% 
  select(group, growth_00_17) %>% 
  rename(estimate = growth_00_17) %>% 
  filter(!group %in% c("Asian Am AVERAGE", "NHPI AVERAGE","US AVERAGE")) %>% 
  mutate(key = "growth", title = "2010-2017 Population Growth by Detailed AAPI Groups")

# plot --------------------------------------------------------------------

#how to use the function

#############################################
#data --> the dataframe you want to plot
#color_type --> please refer to "color_scheme.R"
#style_function: options include "aapidata_style", "aapidata_Vstyle" (vertical bar), "aapidata_style_smallx" (smaller y-axis text)
#logo_image_path: logo image path; write in ""
#label_color: label color for the estimates
#label_size: size of the labels for the estimates
#subtitle: subtitle of the graph
#footnote: source/reference
#directory: directory of where you want to store the final graph
#file_name: file name of the final graph
#############################################


#single bar for count data
plotter_single_count(data = single_bar_count, color_type = "single_dorange", 
                     style_function = aapidata_style, logo_image_path = "examples/logo_aapidata.png",
                     label_color = "#ffffff", label_size = 7, 
                     subtitle = " ", 
                     footnote = "Source: American Community Survey 2017 1-Year files\n",
                     directory = "examples/", file_name = "single_bar_count_example.png")

#single bar for proportion data
plotter_single_pct(data = single_bar_pct, color_type = "single_dorange", 
                     style_function = aapidata_style, logo_image_path = "examples/logo_aapidata.png",
                     label_color = "#ffffff", label_size = 7, 
                     subtitle = " ", 
                     footnote = "Source: American Community Survey 2017 1-Year files\n",
                     directory = "examples/", file_name = "single_bar_pct_example.png")


#single bar for proportion data with unconstraint width
plotter_single_pct_unlim(data = single_bar_pct_unlim, color_type = "single_dorange", 
                   style_function = aapidata_style, logo_image_path = "examples/logo_aapidata.png",
                   label_color = "#ffffff", label_size = 7, 
                   subtitle = " ", 
                   footnote = "Source: American Community Survey 2017 1-Year files\n",
                   directory = "examples/", file_name = "single_bar_pct_unlim_example.png")

#single bar for proportion data with smaller y-axis font size due to large # of groups
plotter_single_pct_unlim_small(data = single_bar_pct_unlim, color_type = "single_dorange", 
                         style_function = aapidata_style_smallx, logo_image_path = "examples/logo_aapidata.png",
                         label_color = "#ffffff", label_size = 7, 
                         subtitle = " ", 
                         footnote = "Source: American Community Survey 2017 1-Year files\n",
                         directory = "examples/", file_name = "single_bar_pct_unlim_smallx_example.png")
