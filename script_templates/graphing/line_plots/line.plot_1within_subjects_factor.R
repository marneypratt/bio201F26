#use this code to make a line plot 
#with one within subjects factor and 
#the ggplot2 package must be loaded 
# make sure your variables are already defined using "define_variables.R"


#make the plot

line_plot <- ggplot(
  data = mydf, 
  aes(
    y = .data[[cont_var]], 
    x = .data[[w_factor]],
    group = .data[[subject_ID]])) +
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

line_plot