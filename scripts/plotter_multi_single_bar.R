# multiple single bar percent 
plotter_multi_pct <- function(data, color_type, style_function, logo_image_path, label_color, label_size, subtitle, footnote, directory, file_name){
  title <- data[1,4]
  plot <- data %>%
    ggplot(aes(x = reorder(group, key_order), y = estimate, fill = key))+
    geom_bar(stat="identity",
             width=.7,
             position = position_dodge(width = 1))+
    coord_flip()+
    scale_y_continuous(labels=scales::percent
                       # , limits = c(0, 1.0)
    )+
    geom_text(aes(label=scales::percent(estimate,1)),
              position = position_dodge(width = 1),
              size=label_size, color = label_color, hjust="inward")+
    style_function()+
    scale_fill_aapidata(palette = color_type)+
    theme(legend.position = "top")+
    theme(legend.position = 'top',
          legend.spacing.x = unit(1.0, 'cm'))+
    labs(title = title, subtitle = subtitle, fill="",x="", y="", caption=footnote)
  
  finalise_plot(plot_name = plot,
                width_pixels = 1400, height_pixels = 800,
                logo_image_path = logo_image_path,
                save_filepath = paste0(directory, file_name))
}

plotter_multi_count <- function(data, color_type, style_function, logo_image_path, label_color, label_size, subtitle, footnote, directory, file_name){
  title <- data[1,4]
  plot <- data %>%
    ggplot(aes(x = reorder(group, key_order), y = estimate, fill = key))+
    geom_bar(stat="identity",
             width=.7,
             position = position_dodge(width = 1))+
    scale_y_continuous(labels=scales::comma)+
      geom_text(aes(label = ifelse(estimate < .001, NA, paste(estimate, "million"))),
              position = position_dodge(width = 1),
              size=label_size, color = label_color, vjust=-0.2)+
    style_function()+
    scale_fill_aapidata(palette = color_type)+
    theme(legend.position = "top")+
    theme(legend.position = 'top',
          legend.spacing.x = unit(1.0, 'cm'))+
    labs(title = title, subtitle = subtitle, fill="",x="", y="", caption=footnote)
  
  finalise_plot(plot_name = plot,
                width_pixels = 1400, height_pixels = 800,
                logo_image_path = logo_image_path,
                save_filepath = paste0(directory, file_name))
}
