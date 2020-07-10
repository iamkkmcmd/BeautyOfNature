# For printing generated data
library(DT)

# for shiny web application
library(shiny)

# grammer of graphics
library(ggplot2)

# generate code with text
library(markdown)

# css loaders
library(shinycssloaders)

# shiny widgets
library(shinyWidgets)

# color picker
library(colourpicker)

#---------------------- Function for making first dataframe--------------------
construct_df1 <- function(a, b, n){
  angle <- pi*(a-sqrt(b))
  points <- n
  t <- (1:points)*angle
  x <- sin(t)*t
  y <- cos(t)*t
  return(data.frame(t, x, y))
}

#---------------------- Function for create phyllotaxis pattern--------------------

ggp_f <- function(DF, p_size, pch, c1, c2){ggplot(DF,aes(x = x, y = y)) + 
    geom_point(shape = pch, fill = c2, color = c2, size = p_size) + 
    labs(title = 'Mathematical Pattern of Phyllotaxis',
         caption = paste0('@iamkkm-cmd',' ','||',' ',Sys.time())) +
    theme(panel.background = element_rect(fill = c1),
          panel.grid = element_blank(),
          axis.ticks = element_blank(),
          axis.title = element_blank(),
          axis.text = element_blank(),
          plot.title = element_text(color = 'red',
                                    hjust = 0.5,
                                    size = 16),
          plot.caption = element_text(color = 'blue',
                                      hjust = 1,
                                      size = 12,
                                      face = 'italic')) +
    coord_fixed()
}