#use this code to make a 2 factor plot 
#with one within subjects factor and 
#one between subjects factor
#the ggplot2 and ggpubr packages must be loaded for this code to work
# make sure your variables are already defined using "define_variables.R"


#create main effect plot 
main_trt_plot <- ggplot(
  data = mydf, 
  aes(
    y = .data[[cont_var]], 
    x = .data[[b_factor]])) +
  geom_point(aes(color = .data[[w_factor]], shape = .data[[w_factor]]), 
             size = 3, alpha = 0.9) +
  
  ###this bit of code adds the horizontal bar - use median or mean as needed
  stat_summary(fun = mean, fun.min = mean, fun.max = mean, 
               geom = "crossbar", width = 0.2, linewidth = 0.6) +
  
  #nicer axis and point shape labels
  xlab("Treatment") + #between subjects factor label
  ylab("___") +  #continuous variable label with units
  labs(shape = "___", color = "___" ) + #within subjects factor label for both blanks
  
  #additional formatting
  theme_classic(base_size=18)  +
  theme(legend.position = "top")

#recolor the plot (you can change these colors 
#but make sure they are color-blind friendly)
main_trt_plot <- ggpubr::ggpar(main_trt_plot, palette = c("#EE7733", "#0077BB"))


main_trt_plot