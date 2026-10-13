#use this code to make a 2 factor plot 
#with one within subjects factor and 
#one between subjects factor
#the ggplot2 and ggpubr packages must be loaded for this code to work

#make sure your variables are already defined


#create main effect plot 
main.trt.plot <- ggplot(
  data = my.df, 
  aes(
    y = .data[[cont.var]], 
    x = .data[[b.factor.var]])) +
  geom_point(aes(color = .data[[w.factor.var]], shape = .data[[w.factor.var]]), 
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
main.trt.plot <- ggpubr::ggpar(main.trt.plot, palette = c("#EE7733", "#0077BB"))


main.trt.plot