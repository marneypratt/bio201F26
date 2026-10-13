#use this code to make a 2 factor plot 
#with one within subjects factor and 
#one between subjects factor
#the ggplot2 package must be loaded for this code to work


#make sure your variables are already defined (cont.var, w.factor.var, b.factor.var) - or you can use the alternative template that just has blanks



#make the plot

factor2.plot <- ggplot(
  data = my.df, 
  aes(
    y = .data[[cont.var]], 
    x = .data[[w.factor.var]],
    group = .data[[subject.ID]])) +
  geom_point(size = 3, color = "orange", alpha = 0.8) +
  geom_line(color = "grey86") + 
  
  ###this bit of code adds the horizontal bar - use median or mean as needed
  stat_summary(fun = mean, fun.min = mean, fun.max = mean, 
               geom = "crossbar", width = 0.3, linewidth = 0.6,
               aes(group = '.data[[w.factor.var]]' )) +
  
  #nicer labels for axis labels 
  xlab("___") +  #within subjects factor label
  ylab("___") + #dependent variable label with units

  theme_classic(base_size=18) +
  facet_grid(~.data[[b.factor.var]])

factor2.plot