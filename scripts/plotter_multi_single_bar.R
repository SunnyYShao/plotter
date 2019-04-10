# multiple single bar percent 
plotter_multi_pct <- function(dta, file_name, color_type, label_size, subtitle, caption){
  title <- dta[1,4]
  plot <- dta %>%
    ggplot(aes(x = reorder(group, key_order), y = estimate, fill = key))+
    geom_bar(stat="identity",
             width=.7,
             position = position_dodge(width = 1))+
    coord_flip()+
    scale_y_continuous(labels=scales::percent
                       , limits = c(0, 1.0)
    )+
    geom_text(aes(label=scales::percent(estimate,1)),
              position = position_dodge(width = 1),
              size=label_size, color = "#3f3f3f", hjust="inward")+
    aapidata_style()+
    scale_fill_aapidata(palette = color_type)+
    theme(legend.position = "top")+
    theme(legend.position = 'top',
          legend.spacing.x = unit(1.0, 'cm'))+
    labs(title = title,subtitle = subtitle, fill="",x="", y="", caption=caption)
  
  finalise_plot(plot_name = plot,
                width_pixels = 1400, height_pixels = 800,
                logo_image_path = "/Users/sunnyshao/Dropbox/AAPIData HQ/2019 APALA Report/logov3.png", ## YOU WILL NEED TO
                save_filepath = paste0("final_graph/", file_name))
}
