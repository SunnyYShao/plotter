

save_plot <- function (plot_grid, width, height, save_filepath) {
  grid::grid.draw(plot_grid)
  #save it
  ggplot2::ggsave(filename = save_filepath,
                  plot=plot_grid, width=(width/72), height=(height/72),  bg="white")
}

#Left align text
# left_align <- function(plot_name, pieces){
#   grob <- ggplot2::ggplotGrob(plot_name)
#   n <- length(pieces)
#   grob$layout$l[grob$layout$name %in% pieces] <- 2
#   return(grob)
# }

create_footer <- function (source_name, logo_image_path) {
  logos <- png::readPNG(logo_image_path)
  # logos <- magick::image_read("dta/all3v2.png")
  # logos <- logos %>%
  #   # image_scale("200") %>%
  #   image_background("#3f3f3f", flatten = TRUE) %>%
  #   image_border("#3f3f3f", "1000x10")
  footer <- grid::grobTree(
                      grid::rectGrob(gp = grid::gpar(fill="#3f3f3f", color = "#3f3f3f",col="#3f3f3f",lwd	=1)),
                      # grid::rasterGrob(logos, x = 0.8) # OG SETUP
                      grid::rasterGrob(logos, x = 0.56)) # logo top
    
  return(footer)
  
}
# create_header <- function (source_name, logo_image_path) {
#   head <- png::readPNG("~/data-science/plotter/dta/header.png")
#   header <- grid::grobTree(
#     grid::rectGrob(gp = grid::gpar(fill="#3f3f3f", color = "#3f3f3f",lwd	=0)),
#     # grid::rasterGrob(png::readPNG(logo_image_path), x = 0.20),
#     # grid::rasterGrob(png::readPNG("dta/Asset 1.png"), x = 0.4),
#     grid::rasterGrob(head, x = 0.5))
#   
#   return(header)
#   
# }
#' Arrange alignment and save BBC ggplot chart
#'
#' Running this function will save your plot with the correct guidelines for publication for a BBC News graphic.
#' It will left align your title, subtitle and source, add the BBC blocks at the bottom right and save it to your specified location.
#' @param plot_name The variable name of the plot you have created that you want to format and save
#' @param source_name The text you want to come after the text 'Source:' in the bottom left hand side of your side
#' @param save_filepath Exact filepath that you want the plot to be saved to
#' @param width_pixels Width in pixels that you want to save your chart to - defaults to 640
#' @param height_pixels Height in pixels that you want to save your chart to - defaults to 450
#' @param logo_image_path File path for the logo image you want to use in the right hand side of your chart,
#'  which needs to be a PNG file - defaults to BBC blocks image that sits within the data folder of your package
#' @return (Invisibly) an updated ggplot object.

#' @keywords finalise_plot
#' @examples
#' finalise_plot(plot_name = myplot,
#' source = "The source for my data",
#' save_filepath = "filename_that_my_plot_should_be_saved_to-nc.png",
#' width_pixels = 640,
#' height_pixels = 450,
#' logo_image_path = "logo_image_filepath.png"
#' )
#'
#' @export
finalise_plot <- function(plot_name,
                          source_name,
                          save_filepath=file.path(Sys.getenv("TMPDIR"), "tmp-nc.png"),
                          width_pixels=640,
                          height_pixels=450,
                          logo_image_path = file.path(system.file("data", package = 'bbplot'),"placeholder.png")) {
  
  footer <- create_footer(source_name, logo_image_path)
  # header <- create_header(source_name, logo_image_path)
  
  #Draw your left-aligned grid
  # plot_left_aligned <- left_align(plot_name, c("subtitle", "title", "caption"))
  
  # plot_grid <- ggpubr::ggarrange(plot_left_aligned,footer,
  #                                ncol = 1, nrow = 2,
  #                                # heights=c(1, .25/(height_pixels/800)))
  #                                heights = c(1,.10))

## OG SETUP    
# plot_grid <- gridExtra::grid.arrange(
#     plot_left_aligned,
#     footer,
#     nrow=2,
#     ncol = 1,
#     heights = c(1,.1))

## LOGO TOP  
plot_grid <- gridExtra::grid.arrange(
  footer,
  plot_name,
  nrow=2,
  ncol = 1,
  heights = c(.2,1))  
  
  
  ## print(paste("Saving to", save_filepath))
  save_plot(plot_grid, width_pixels, height_pixels, save_filepath)
  ## Return (invisibly) a copy of the graph. Can be assigned to a
  ## variable or silently ignored.
  invisible(plot_grid)
}

