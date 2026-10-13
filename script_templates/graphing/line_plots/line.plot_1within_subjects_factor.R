#use this code to make a line plot 
#with one within subjects factor and 
#the ggplot2 package must be loaded 
#variables must be defined (cont.var, w.factor.var, subject.ID) for this code to work


#make the plot

line.plot <- ggplot(
  data = my.df, 
  aes(
    y = .data[[cont.var]], 
    x = .data[[w.factor.var]],
    group = .data[[subject.ID]])) +
  geom_point(size = 2, color = "orange", alpha = 0.8) +
  geom_line(color = "grey86") + 
  
  ###this bit of code adds the horizontal bar - use median or mean as needed
  stat_summary(fun = mean, fun.min = mean, fun.max = mean, 
               geom = "crossbar", width = 0.2, linewidth = 0.6,
               aes(group = '.data[[w.factor.var]]' )) +
  
  #nicer labels for axis labels 
  xlab("___") +  #within subjects factor label
  ylab("___") +  #dependent variable label with units
  
  theme_classic(base_size=14) 

line.plot