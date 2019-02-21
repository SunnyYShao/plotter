# Defining color schemes 

# AAPI DATA ---------------------------------------------------------------

#all possible colors for infographics
aapidata <- c(
  `orange`       = "#EE8B46",
  `light orange` = "#EFA875",
  `tan`       = "#EDDD9D",
  `light blue`     = "#A3C8D1",
  `blue`     = "#63BBD1",
  `deep blue` = "#1BACCE",
  `grey` = "#C6C4C4",
  `darker grey` = "#B2B1B1",
  `light red`  = "#E28A86",
  `red`  = "#DC7070")

#create a function that call the color by name
aapidata_cols <- function(...) {
  cols <- c(...)
  
  if (is.null(cols))
    return (aapidata)
  
  aapidata[cols]
}
aapidata_cols()

#create different list of color-schemes
#each color palette need to have the same number of groups as the table we are trying to graph
aapidata_palettes <- list(
  #the code pull colors from both end (instead of  left-to-right)
  `single_red` = aapidata_cols("red"),
  
  `single_blue` = aapidata_cols("blue"),
  
  `single_orange` = aapidata_cols("orange"),
  
  `scale2` = aapidata_cols("red", "orange"),
  
  `scale3` = aapidata_cols("red", "grey", "orange"),
  
  `scale4` = aapidata_cols("red", "light red", "light orange", "orange"),
  
  `scale5` = aapidata_cols("red", "light red", "grey", "light orange", "orange"),
  
  `scale6` = aapidata_cols("red", "light red", "orange", "light orange", "light blue", "blue"),
  
  `degree_blue` = aapidata_cols("deep blue", "darker grey"),
  
  `degree_red` = aapidata_cols("red", "darker grey"),
  
  `degree_orange` = aapidata_cols("orange","darker grey"),
  
  `yes_no`  = aapidata_cols("orange", "blue"),
  
  `cat3`  = aapidata_cols("red", "orange", "blue"),
  
  `cat4`  = aapidata_cols("red", "light red", "orange", "blue"),
  
  `cat5`  = aapidata_cols("red", "light red", "light orange", "orange", "blue"),
  
  `cat6`  = aapidata_cols("red", "light red", "light orange", "orange", "light blue", "blue"),
  
  `party2`  = aapidata_cols("red", "blue"),
  
  `party3`  = aapidata_cols("red", "blue", "orange"),
  
  `party4`  = aapidata_cols("red", "light red", "light blue", "blue"))
  
  

#create a function to 
aapidata_pal <- function(palette = "categorical", reverse = FALSE, ...) {
  pal <- aapidata_palettes[[palette]]
  
  if (reverse) pal <- rev(pal)
  
  colorRampPalette(pal, ...)
}
#test for example, if I want 
aapidata_pal(palette = "yes_no", reverse = FALSE)



scale_fill_aapidata <- function(palette = "scale", discrete = TRUE, reverse = FALSE, ...) {
  pal <- aapidata_pal(palette = palette, reverse = reverse)
  if (discrete) {
    discrete_scale("fill", paste0("aapidata_", palette), palette = pal, ...)
  } else {
    scale_fill_gradientn(colours = pal(100), ...)
  }
}


scale_color_aapidata <- function(palette = "scale", discrete = TRUE, reverse = FALSE, ...) {
  pal <- aapidata_pal(palette = palette, reverse = reverse)
  if (discrete) {
    discrete_scale("fill", paste0("aapidata_", palette), palette = pal, ...)
  } else {
    scale_color_gradientn(colours = pal(256), ...)
  }
}

