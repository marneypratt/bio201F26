# the code below will calculate standard deviation for a variable of interest 
# grouped by up to two factors (remove any factors as needed)
# the SD will be rounded to two significant figures
# the dplyr package must be loaded before this will work
# make sure your variables are already defined using "define_variables.R"

#calculate rounded SD
mydf |> 
  
  #this groups by a defined within subjects factor
  group_by(.data[[w_factor]])  |> 
  
  # remove missing values 
  filter(!is.na(.data[[cont_var]])) |> 
  
  #calculate the rounded values
  summarise(SD = signif(sd(.data[[cont_var]]), digits=2))