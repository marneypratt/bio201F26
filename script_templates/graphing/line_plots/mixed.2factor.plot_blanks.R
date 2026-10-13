#use this code to make a 2 factor plot 
#with one within subjects factor and 
#one between subjects factor
#the ggplot2 package must be loaded for this code to work

#create 2 factor plot 
factor2.plot <- ggplot(
  data = ___,           #data frame name
  aes(
    y = ___,            #continuous dependent variable column name
    x = ___,            #within subjects factor column name
    group = `___`)) +  #subjects column name
  geom_point(size = 3, shape = 21, fill = "steelblue", alpha = 0.5) +
  geom_line() + 
  
  ###this bit of code adds the horizontal bar 
  ###keep as median or change to mean
  stat_summary(
    fun = median, fun.min = median, fun.max = median, 
    geom = "crossbar", width = 0.3, linewidth = 0.6,
    aes(group = '___' )) + #within subjects factor column name
  
  xlab("___") +  #within subjects factor label
  ylab("___") + #dependent variable label with units
  theme_classic(base_size=18) +
  facet_grid(~___)  #between subjects factor column name
factor2.plot

#see https://www.datanovia.com/en/lessons/mixed-anova-in-r/
#for how to do post hoc tests