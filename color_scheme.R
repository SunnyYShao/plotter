# Defining color schemes 

# AAPI DATA ---------------------------------------------------------------

#all possible colors for infographics
aapidata <- c(
  `orange`       = "#EE8B46",
  `light orange` = "#EFA875",
  `tan`       = "#EDDD9D",
  `light blue`     = "#A3C8D1",
  `blue`     = "#63BBD1",
  `grey` = "#C6C4C4",
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
  `scale7` = aapidata_cols("red", "light red", "orange", "light orange", "grey", "light blue", "blue"),
  `scale5` = aapidata_cols("red", "light red", "grey", "light orange", "orange"),
  
  `scale4` = aapidata_cols("red", "light red", "light orange", "orange"),
  
  `scale3` = aapidata_cols("red", "grey", "orange"),
  
  `scale2` = aapidata_cols("red", "orange"),
  
  `cat4`  = aapidata_cols("light orange", "orange", "light blue",  "blue"),
  
  `cat2`  = aapidata_cols("orange", "blue"),
  
  `partisan_DRIOD`   = aapidata_cols("grey", "tan", "light orange", "orange", "red", "blue"),
  
  `partisan_RDSD` = aapidata_cols("grey", "orange", "blue", "red"),
  
  `partisan_DRD` = aapidata_cols("grey", "red", "blue"),
  
  `partisan3_SD`  = aapidata_cols( "grey", "light blue", "blue"),
  
  `partisan3_SR`  = aapidata_cols("light blue", "grey", "red"),
  
  `partisan_DROD` = aapidata_cols("grey", "orange", "red", "blue"),
  
  `scale3_1m`  = aapidata_cols("blue", "tan", "orange"),
  
  `scale4_party_2m`  = aapidata_cols("blue", "grey", "tan", "red"),
  
  `scale4_party_DNDR`  = aapidata_cols("red", "grey", "tan", "blue"),
  
  `scale5_1m`  = aapidata_cols("blue", "light blue", "tan", "light orange", "orange"),
  
  `scale5`  = aapidata_cols("grey", "blue", "light blue", "light orange", "orange"),
  
  # `scale6_2m`  = aapidata_cols("blue", "light blue", "grey", "tan", "light orange", "orange"),
  
  `scale4_2m`  = aapidata_cols("blue", "grey", "tan", "orange"),
  
  `special6`   = aapidata_cols("grey", "tan", "light orange", "orange", "red", "blue"),
  
  `ordered`    = aapidata_cols("grey", "tan", "light blue", "blue", "light orange", "orange"),
  
  `ordered5`    = aapidata_cols("grey", "light blue", "blue", "light orange", "orange"),
  
  `ordered4`    = aapidata_cols("grey", "tan", "light orange", "orange"),
  
  `yes_no_d`   = aapidata_cols("grey", "blue", "orange"),
  
  `yes_no`   = aapidata_cols("blue", "orange"),
  
  `yn_BD`   = aapidata_cols("grey", "blue", "tan", "orange"))

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

