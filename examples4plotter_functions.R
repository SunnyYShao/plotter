# install the latest R and Rstudio -----------------------------------------------

# latest R: https://cloud.r-project.org/
#Latest Rstudio: https://rstudio.com/products/rstudio/download/#download
  
# install required packages -----------------------------------------------
# install.packages("tidyverse")
install.packages("magick")
install.packages("readxl")
install.packages("readr")
install.packages("png")
install.packages("gridExtra")
install.packages("dplyr")
install.packages("ggplot2")
install.packages("here")
# library the following packages ------------------------------------------
library(tidyverse)
# library(tidycensus)
library(magick)
library(readxl)
# library(readr)
library(here)

# Source all the plotting functions ---------------------------------------
source("color_scheme.R")
source("scripts/aapidata_style.R")
source("scripts/finalize_plot.R")
source("scripts/plotter_single_bar.R")
source("scripts/plotter_stacked_bar.R")
source("scripts/plotter_multi_single_bar.R")

# cleaning the data -----------------------------------------------------------------
## 1. load the data
dta <- read_excel("examples/data_single_bar.xlsx")

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

#clean data for stacked bar graph percent
stacked_bar_pct <- read_csv("examples/data_stacked_bar.csv")
stacked_bar_pct$key <- factor(stacked_bar_pct$key, levels=c("Extremely important", "Very important", "Somewhat important", "Not that important", "Don't Know"))

#clean data for vertical stacked bar graph percent
Vstacked_bar_pct <- read_csv("examples/data_Vstacked.csv")

#clean data for multiple single bar graph percent
multi_bar_pct <- read_csv("examples/data_multi_bar.csv") %>% 
  mutate(key_order = case_when(
    key=="Men" ~1,
    key=="Women" ~2))
# documentation - functions ############################################
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


# single bar graphs - demonstration --------------------------------------------------------------------

#single bar for count data
plotter_single_count(data = single_bar_count, color_type = "single_dorange", 
                     style_function = aapidata_style(), logo_image_path = "examples/logo_aapidata.png",
                     label_color = "#ffffff", label_size = 7, 
                     subtitle = " ", 
                     footnote = "Source: American Community Survey 2017 1-Year files\n",
                     directory = "examples/", file_name = "single_bar_count_example.png")

#single bar for proportion data
plotter_single_pct(data = single_bar_pct, color_type = "single_dorange", 
                     style_function = aapidata_style(), logo_image_path = "examples/logo_aapidata.png",
                     label_color = "#ffffff", label_size = 7, 
                     subtitle = " ", 
                     footnote = "Source: American Community Survey 2017 1-Year files\n",
                     directory = "examples/", file_name = "single_bar_pct_example.png")


#single bar for proportion data with unconstraint width
plotter_single_pct_unlim(data = single_bar_pct_unlim, color_type = "single_dorange", 
                   style_function = aapidata_style(), logo_image_path = "examples/logo_aapidata.png",
                   label_color = "#ffffff", label_size = 7, 
                   subtitle = " ", 
                   footnote = "Source: American Community Survey 2017 1-Year files\n",
                   directory = "examples/", file_name = "single_bar_pct_unlim_example.png")

#single bar for proportion data with smaller y-axis font size due to large # of groups
plotter_single_pct_unlim_small(data = single_bar_pct_unlim, color_type = "single_dorange", 
                         style_function = aapidata_style_smallx(), logo_image_path = "examples/logo_aapidata.png",
                         label_color = "#ffffff", label_size = 7, 
                         subtitle = " ", 
                         footnote = "Source: American Community Survey 2017 1-Year files\n",
                         directory = "examples/", file_name = "single_bar_pct_unlim_smallx_example.png")

# multiple single bar graphs
plotter_multi_pct(data = multi_bar_pct, color_type = "yes_no", 
                  style_function = aapidata_style(), logo_image_path = "examples/logo_aapidata.png",
                  label_color = "#ffffff", label_size = 7, 
                  subtitle = " ",
                  footnote = "Source: American Community Survey 2017\n",
                  directory = "examples/", file_name = "multi_single_bar_example.png")



# stacked bar graph - demonstration ---------------------------------------

#horizontal stacked bar
plotter_stacked_pct(data = stacked_bar_pct, color_type = "scale5_2", 
                    style_function = aapidata_style_smallx(), logo_image_path = "examples/logo_aapidata.png",
                    label_color = "#ffffff", label_size = 10, 
                    subtitle = "How important is it that workers can retire with dignity and financial security?\n", 
                    footnote = "Source: Asian American Voter Survey 2018 \n",
                    directory = "examples/", file_name = "stacked_bar_pct_smallX_example.png")

#vertial stacked bar
plotter_Vstacked_pct(data = Vstacked_bar_pct, color_type = "yes_no", 
                    style_function = aapidata_Vstyle(), logo_image_path = "examples/logo_aapidata.png",
                    label_color = "#ffffff", label_size = 7, 
                    subtitle = " ",
                    footnote = "Source: CPS Ongoing Rotation Group 2010-2018 \n",
                    directory = "examples/", file_name = "Vstacked_bar_pct_smallX_example.png")




