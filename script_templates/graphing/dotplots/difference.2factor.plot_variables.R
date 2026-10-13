#this code will subtract values for each subject and then graph the difference
##dplyr and ggplot2 need to be loaded 
##you also need to make sure your variables are defined (cont.var, b.factor.var, w.factor.var)


#first we need to change the format of the data from long to wide
#this way, we will have one row for each subject and can take a difference
#between the after and before values
my.df.wide  <- my.df |> 
  dplyr::select(.data[[subject.ID]], .data[[b.factor.var]], .data[[w.factor.var]], .data[[cont.var]]) |> 
  pivot_wider(
    names_from = .data[[w.factor.var]],
    
    values_from = .data[[cont.var]]
  )

#next, take the difference between the values for each subject
my.df.diff <- my.df.wide |> 
  
  #put the name of the categories you are subracting for each subject in 
  #the two blanks below (For example After - Before)
  mutate(change.cont.var = ___ - ___)


#create difference plot 
difference.plot <- ggplot(
  data = my.df.diff, 
  aes(
    y = change.cont.var, 
    x = .data[[b.factor.var]])) +
  geom_point(size = 3, color = "orange", alpha = 0.8) +
  
  ###this bit of code adds the horizontal bar - use median or mean as needed
  stat_summary(fun = mean, fun.min = mean, fun.max = mean, 
               geom = "crossbar", width = 0.2, linewidth = 0.6,
               aes(group = '.data[[b.factor.var]]' )) +
  
  #these two lines make the nicer axis labels so fill in the blanks as needed
  #(include units!)
  xlab("___") +
  ylab("___") +
  
  
  theme_classic(base_size=16) 


difference.plot
