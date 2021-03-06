# plotter stacked bar -----------------------------------------------------

#percent 
plotter_stacked_pct <- function(data, color_type, style_function, logo_image_path, label_color, label_size, subtitle, footnote, directory, file_name){
  title <- data[1,4]
  plot <- data %>%
    ggplot(aes(x = reorder(group, key_order), y = estimate, fill = key))+
    geom_bar(stat="identity",
             width=.7,
             position = position_stack(reverse = TRUE))+
    coord_flip()+
    scale_y_continuous(labels=scales::percent, limits = c(0, 1.05))+
    geom_text(aes(label = ifelse(estimate < 0.035, NA, scales::percent(estimate, 1))),
              position = position_stack(reverse = TRUE,vjust = .5),
              size=label_size, color = label_color)+
    style_function+
    scale_fill_aapidata(palette = color_type)+
    theme(legend.position = "top")+
    theme(legend.position = 'top',
          legend.spacing.x = unit(0.2, 'cm'))+
    labs(title = title,subtitle = subtitle, fill="",x="", y="", caption=footnote)
  
  finalise_plot(plot_name = plot,
                width_pixels = 1040, height_pixels = 800,
                logo_image_path = logo_image_path,
                save_filepath = paste0(directory, file_name))
}

#percent vertical
plotter_Vstacked_pct <- function(data, color_type, style_function, logo_image_path, label_color, label_size, subtitle, footnote, directory, file_name){
  title <- data[1,4]
  plot <- data %>%
    ggplot(aes(x = reorder(group, key_order), y = estimate, fill = key))+
    geom_bar(stat="identity",
             width=.7,
             position = position_stack(reverse = F))+
    scale_y_continuous(labels=scales::percent)+
    geom_text(aes(label = ifelse(estimate < .008, NA, scales::percent(estimate, 0.1))),
              position = position_stack(vjust = .5),
              size=label_size, color = label_color)+
    style_function+
    scale_fill_aapidata(palette = color_type)+
    theme(legend.position = "top")+
    theme(legend.position = 'top',
          legend.spacing.x = unit(1.0, 'cm'))+
    labs(title = title,subtitle = subtitle, fill="",x="", y="", caption=footnote)
  
  finalise_plot(plot_name = plot,
                width_pixels = 1040, height_pixels = 800,
                logo_image_path = logo_image_path,
                save_filepath = paste0(directory, file_name))
}
