# plotter single bar  --------------------------------------------------------
#count estimate
plotter_single_count <- function(dta, file_name, color_type, label_size, subtitle, caption){
  title <- dta[1,4]
  plot <- dta %>%
    ggplot(aes(x = reorder(group, estimate), y = estimate, fill = key))+
    geom_bar(stat="identity",
             width=.7,
             colour="transparent")+
    coord_flip()+
    # scale_y_continuous(labels=scales::percent)+
    scale_y_continuous(labels=scales::comma)+
    # geom_text(aes(label=scales::comma(tot)),
    #           size=11, color = "white", nudge_y =300000)+
    geom_text(aes(label=scales::comma(estimate)),
              position=position_dodge(width=1),
              color="#3f3f3f", size=label_size, hjust="inward")+
    aapidata_style()+
    scale_fill_aapidata(palette = color_type)+
    theme(legend.position = "none")+
    labs(title = paste0("\n", title, sep=""), subtitle=subtitle, fill="",x="", y="", caption=caption)
  
  
  finalise_plot(plot_name = plot,
                width_pixels = 1400, height_pixels = 800,
                logo_image_path = "/Users/sunnyshao/Dropbox/AAPIData HQ/2019 APALA Report/logov3.png", ## YOU WILL NEED TO
                save_filepath = paste0("final_graph/", file_name))
}

# plotter single bar percent

plotter_single_pct <- function(dta, file_name, color_type, label_size, subtitle, caption){
  title <- dta[1,4]
  plot <- dta %>%
    ggplot(aes(x = reorder(group, estimate), y = estimate, fill = key))+
    geom_bar(stat="identity",
             width=.7,
             colour="transparent")+
    coord_flip()+
    scale_y_continuous(labels=scales::percent, limits = c(0, 1))+
    geom_text(aes(label=scales::percent(estimate, 1)),
              position = position_stack(reverse = TRUE),
              size=label_size, color = "#3f3f3f", hjust="inward")+
    aapidata_style()+
    scale_fill_aapidata(palette = color_type)+
    theme(legend.position = "none")+
    labs(title = paste0("\n", title, sep=""), subtitle=subtitle, fill="",x="", y="", caption=caption)
  
  
  finalise_plot(plot_name = plot,
                width_pixels = 1400, height_pixels = 800,
                logo_image_path = "/Users/sunnyshao/Dropbox/AAPIData HQ/2019 APALA Report/logov3.png", ## YOU WILL NEED TO
                save_filepath = paste0("final_graph/", file_name))
}

plotter_single_pct_unlim <- function(dta, file_name, color_type, label_size, subtitle, caption){
  title <- dta[1,4]
  plot <- dta %>%
    ggplot(aes(x = reorder(group, estimate), y = estimate, fill = key))+
    geom_bar(stat="identity",
             width=.7,
             colour="transparent")+
    coord_flip()+
    scale_y_continuous(labels=scales::percent)+
    geom_text(aes(label=scales::percent(estimate, accuracy = 1)),
              position = position_stack(reverse = TRUE),
              size=label_size, color = "#3f3f3f", hjust="inward")+
    aapidata_style()+
    scale_fill_aapidata(palette = color_type)+
    theme(legend.position = "none")+
    labs(title = paste0("\n", title, sep=""), subtitle=subtitle, fill="",x="", y="", caption=caption)
  
  
  finalise_plot(plot_name = plot,
                width_pixels = 1400, height_pixels = 800,
                logo_image_path = "/Users/sunnyshao/Dropbox/AAPIData HQ/2019 APALA Report/logov3.png", ## YOU WILL NEED TO
                save_filepath = paste0("final_graph/", file_name))
}
#single bar percent unlimited with smaller axis label font size
plotter_single_pct_unlim_small <- function(dta, file_name, color_type, label_size, subtitle, caption){
  title <- dta[1,4]
  plot <- dta %>%
    ggplot(aes(x = reorder(group, estimate), y = estimate, fill = key))+
    geom_bar(stat="identity",
             width=.7,
             colour="transparent")+
    coord_flip()+
    scale_y_continuous(labels=scales::percent)+
    geom_text(aes(label=scales::percent(estimate, accuracy = 1)),
              position = position_stack(reverse = TRUE),
              size=label_size, color = "#3f3f3f", hjust="inward")+
    aapidata_style_smallx()+
    scale_fill_aapidata(palette = color_type)+
    theme(legend.position = "none")+
    labs(title = paste0("\n", title, sep=""), subtitle=subtitle, fill="",x="", y="", caption=caption)
  
  
  finalise_plot(plot_name = plot,
                width_pixels = 1400, height_pixels = 800,
                logo_image_path = "/Users/sunnyshao/Dropbox/AAPIData HQ/2019 APALA Report/logov3.png", ## YOU WILL NEED TO
                save_filepath = paste0("final_graph/", file_name))
}
