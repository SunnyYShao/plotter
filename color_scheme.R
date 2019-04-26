# Defining color schemes 

# AAPI DATA ---------------------------------------------------------------

#all possible colors for infographics
aapidata <- c(
  `orange`       = "#EE8B46",
  `darker orange` = "#f46a09",
  `dark orange` = "#f4771f",
  `light orange` = "#EFA875",
  `tan`       = "#EDDD9D",
  `darker tan` = "#eece4d",
  `light blue`     = "#A3C8D1",
  `blue`     = "#63BBD1",
  `deeper blue` = "#02a9d0",
  `deep blue` = "#1BACCE",
  `grey` = "#C6C4C4",
  `darker grey` = "#B2B1B1",
  `light red`  = "#E28A86",
  `red`  = "#DC7070",
  `darker red` = "#CE4952")

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
  
  `single_dblue` = aapidata_cols("deep blue"),
  
  `single_orange` = aapidata_cols("orange"),
  
  `single_dorange` = aapidata_cols("dark orange"),
  
  `scale_orange` = aapidata_cols("dark orange", "orange", "light orange", "grey"),
  
  `scale2` = aapidata_cols("red", "orange"),
  
  `scale3` = aapidata_cols("red", "grey", "orange"),
  
  `scale4` = aapidata_cols("red", "light red", "light orange", "orange"),
  
  `scale4_special` = aapidata_cols("darker orange", "orange", "blue", "deeper blue"),
  
  `scale5` = aapidata_cols("red", "light red", "grey", "light orange", "orange"),
  
  `scale5_2` = aapidata_cols("darker orange", "orange", "blue", "deeper blue", "darker grey"),
  
  `scale5_special` = aapidata_cols("orange", "light orange", "light blue", "blue", "grey"),
  
  `scale6` = aapidata_cols("red", "light red", "orange", "light orange", "light blue", "blue"),
  
  `degree_blue` = aapidata_cols("deep blue", "darker grey"),
  
  `degree_red` = aapidata_cols("darker red", "grey"),
  
  `degree_orange` = aapidata_cols("darker orange","grey"),
  
  `yes_no`  = aapidata_cols("orange", "blue"),
  
  `yes_no_dk`  = aapidata_cols("orange", "blue", "grey"),
  
  `cat2`  = aapidata_cols("blue", "deeper blue"),
  
  `cat3`  = aapidata_cols("red", "orange", "blue"),
  
  `cat3_special`  = aapidata_cols("deeper blue", "blue", "orange"),
  
  `cat4`  = aapidata_cols("red", "light red", "orange", "blue"),
  
  `cat4_2`  = aapidata_cols("deeper blue", "blue", "orange", "darker orange"),
  
  `cat4_special` = aapidata_cols("blue", "light orange", "grey", "red"),
  
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
    scale_fill_gradientn(colours = pal(50), ...)
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

