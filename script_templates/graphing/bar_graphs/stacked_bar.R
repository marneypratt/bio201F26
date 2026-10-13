#this code will make stacked bar graphs using ggplot2
#make sure your dependent variable is in proportions (0-1) not in percentages (0-100%)


ggplot(
data = ___, #put the data frame name here

#set the aesthetics
aes(x = ___,       #put the factor to compare between bars on the x-axis
    y = ___,       #proportion values = y
    fill = __, color = __)) + #factor for within bars for fill & color
  
  #adds stacked bars
  geom_bar(position = "fill", stat = "identity") +
  

  #nicer labels 
  xlab("___") +  #nice label for x-axis
  ylab("___") +  #nice label for y-axis
  scale_fill_discrete(
    name = "____",           #nicer label for factor for within bars
    labels = c("___",        #nicer label to levels within factor 
               "___",
               "___", 
               "___", 
               "___" )) +
  
  scale_color_discrete(  
    name = "___",          #nicer label for factor for within bars
    labels = c("___",      #nicer label to levels within factor
               "___",
               "___", 
               "___", 
               "___" )) +
  
  #additional formatting
  coord_cartesian(ylim = c(0,1), expand = FALSE, clip = 'off') +
  theme_classic(base_size = 12)  +  #sets the font size
  theme(legend.position = "right") +  #controls legend/key

  #you can use the line below to split by factors
  #(can add other factors if needed)
  facet_grid(rows = vars(____), cols = vars(____)) 

#see the resources below for some additional options to make a nice plot 
# https://www.r-graph-gallery.com/48-grouped-barplot-with-ggplot2.html
# https://ggplot2.tidyverse.org/index.html
# https://r-charts.com/part-whole/stacked-bar-chart-ggplot2/