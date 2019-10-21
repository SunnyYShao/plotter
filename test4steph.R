data <- data.frame("key" = c("Women","Men","Women","Men","Women","Men"),
                   estimate = c(0.04,0.10,0.6,0.14,0.90,0.76),
                   #"ci_min" = c(),
                   #"ci_max" = c(),
                   # "sort" = c(1,2,3,4,5,6),
                   "group"=c("Yes, I have seriously considered it.",
                             "Yes, I have seriously considered it.",
                             "Yes, it has crossed my mind",
                             "Yes, it has crossed my mind",
                             "No, I have never thought about it.",
                             "No, I have never thought about it."),
                   title = "HAVE YOU EVER CONSIDERED RUNNING \n FOR ELECTED OFFICE?")

data <- data %>% select(group, key, estimate, title) %>% 
  mutate(key_order = case_when(
    key=="Men" ~2,
    key=="Women" ~1))

# multiple single bar graphs
#you can go inside the aapidata_style script and plotter_multi_pct script to change color and logo
plotter_multi_pct(data = data, color_type = "CSI_2color", 
                  style_function = aapidata_style, logo_image_path = "examples/logo_aapidata.png",
                  label_color = "#ffffff", label_size = 7, 
                  subtitle = " ",
                  footnote = "Source: xxxx\n",
                  directory = "examples/", file_name = "example4Steph.png")
