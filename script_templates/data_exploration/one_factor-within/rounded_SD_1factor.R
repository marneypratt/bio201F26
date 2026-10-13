# the code below will calculate standard deviation for a variable of interest 
# grouped by up to two factors (remove any factors as needed)
# the SD will be rounded to two significant figures
# the dplyr package must be loaded before this will work
# the variables included here need to be defined to get this code to run

#calculate rounded SD
my.df |> 
  
  #this groups by a defined within subjects factor
  group_by(.data[[w.factor.var]])  |> 
  
  # remove missing values 
  filter(!is.na(.data[[cont.var]])) |> 
  
  #calculate the rounded values
  summarise(SD = signif(sd(.data[[cont.var]]), digits=2))