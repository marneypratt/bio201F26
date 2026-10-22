#this code will subtract values for each subject and then graph the difference
##dplyr and ggplot2 need to be loaded 
# make sure your variables are already defined using "define_variables.R"


#first we need to change the format of the data from long to wide
#this way, we will have one row for each subject and can take a difference
#between the after and before values
mydf_wide  <- mydf |> 
  dplyr::select(.data[[subject_ID]], .data[[b_factor]], .data[[w_factor]], .data[[cont_var]]) |> 
  pivot_wider(
    names_from = .data[[w_factor]],
    
    values_from = .data[[cont.var]]
  )

#next, take the difference between the values for each subject
mydf_diff <- mydf_wide |> 
  
  #put the name of the categories you are subracting for each subject in 
  #the two blanks below (For example After - Before)
  mutate(change_cont_var = ___ - ___)


#create difference plot 
difference_plot <- ggplot(
  data = mydf_diff, 
  aes(
    y = change_cont_var, 
    x = .data[[b_factor]])) +
  geom_point(size = 3, color = "orange", alpha = 0.8) +
  
  ###this bit of code adds the horizontal bar - use median or mean as needed
  stat_summary(fun = mean, fun.min = mean, fun.max = mean, 
               geom = "crossbar", width = 0.2, linewidth = 0.6,
               aes(group = '.data[[b_factor]]' )) +
  
  #these two lines make the nicer axis labels so fill in the blanks as needed
  #(include units!)
  xlab("___") +
  ylab("___") +
  
  
  theme_classic(base_size=16) 


difference_plot
