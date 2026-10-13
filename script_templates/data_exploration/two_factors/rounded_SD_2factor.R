# the code below will calculate standard deviation for a variable of interest 
# grouped by up to two factors (remove any factors as needed)
# the SD will be rounded to two significant figures
# the dplyr package must be loaded before this will work
# the variables included here need to be defined to get this code to run

#calculate rounded SD
my.df |> 
  
  #this groups by a defined set of between and within subjects factors
  #remove factors as needed
  group_by(.data[[w.factor.var]], .data[[b.factor.var]] )  |> 
  
  # remove missing values 
  filter(!is.na(.data[[cont.var]])) |> 
  
  #calculate the rounded values
  summarise(SD = signif(sd(.data[[cont.var]]), digits=2))