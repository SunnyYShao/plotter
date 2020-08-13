# plotter single bar  --------------------------------------------------------
#count estimate
plotter_single_count <- function(data, color_type, style_function, logo_image_path, label_color, label_size, subtitle, footnote, directory, file_name){
  title <- data[1,4]
  plot <- data %>%
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
              color=label_color, size=label_size, hjust="inward")+
    style_function+
    scale_fill_aapidata(palette = color_type)+
    theme(legend.position = "none")+
    labs(title = paste0("\n", title, sep=""), subtitle=subtitle, fill="",x="", y="", caption=footnote)
  
  
  finalise_plot(plot_name = plot,
                width_pixels = 1040, height_pixels = 800,
                logo_image_path = logo_image_path, ## YOU WILL NEED TO
                save_filepath = paste0(directory, file_name))
}

# plotter single bar percent

plotter_single_pct <- function(data, color_type, style_function, logo_image_path, label_color, label_size, subtitle, footnote, directory, file_name){
  title <- data[1,4]
  plot <- data %>%
    ggplot(aes(x = reorder(group, estimate), y = estimate, fill = key))+
    geom_bar(stat="identity",
             width=.7,
             colour="transparent")+
    coord_flip()+
    scale_y_continuous(labels=scales::percent, limits = c(0, 1))+
    geom_text(aes(label=scales::percent(estimate, 1)),
              position = position_stack(reverse = TRUE),
              size=label_size, color = label_color, hjust="inward")+
    style_function+
    scale_fill_aapidata(palette = color_type)+
    theme(legend.position = "none")+
    labs(title = paste0("\n", title, sep=""), subtitle=subtitle, fill="",x="", y="", caption=footnote)
  
  
  finalise_plot(plot_name = plot,
                width_pixels = 1040, height_pixels = 800,
                logo_image_path = logo_image_path, ## YOU WILL NEED TO
                save_filepath = paste0(directory, file_name))
}

plotter_single_pct_unlim <- function(data, color_type, style_function, logo_image_path, label_color, label_size, subtitle, footnote, directory, file_name){
  title <- data[1,4]
  plot <- data %>%
    ggplot(aes(x = reorder(group, estimate), y = estimate, fill = key))+
    geom_bar(stat="identity",
             width=.7,
             colour="transparent")+
    coord_flip()+
    scale_y_continuous(labels=scales::percent)+
    geom_text(aes(label=scales::percent(estimate, accuracy = 1)),
              position = position_stack(reverse = TRUE),
              size=label_size, color = label_color, hjust="inward")+
    style_function+
    scale_fill_aapidata(palette = color_type)+
    theme(legend.position = "none")+
    labs(title = paste0("\n", title, sep=""), subtitle=subtitle, fill="",x="", y="", caption=footnote)
  
  
  finalise_plot(plot_name = plot,
                width_pixels = 1040, height_pixels = 800,
                logo_image_path = logo_image_path, ## YOU WILL NEED TO
                save_filepath = paste0(directory, file_name))
}
#single bar percent unlimited with smaller axis label font size
plotter_single_pct_unlim_small <- function(data, color_type, style_function, logo_image_path, label_color, label_size, subtitle, footnote, directory, file_name){
  title <- data[1,4]
  plot <- data %>%
    ggplot(aes(x = reorder(group, estimate), y = estimate, fill = key))+
    geom_bar(stat="identity",
             width=.7,
             colour="transparent")+
    coord_flip()+
    scale_y_continuous(labels=scales::percent)+
    geom_text(aes(label=scales::percent(estimate, accuracy = 1)),
              position = position_stack(reverse = TRUE),
              size=label_size, color = label_color, hjust="inward")+
    style_function+
    scale_fill_aapidata(palette = color_type)+
    theme(legend.position = "none")+
    labs(title = paste0("\n", title, sep=""), subtitle=subtitle, fill="",x="", y="", caption=footnote)
  
  
  finalise_plot(plot_name = plot,
                width_pixels = 1040, height_pixels = 800,
                logo_image_path = logo_image_path,
                save_filepath = paste0(directory, file_name))
}
