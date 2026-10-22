# the code below will calculate standard deviation for a variable of interest 
# grouped by up to two factors (remove any factors as needed)
# the SD will be rounded to two significant figures
# the dplyr package must be loaded before this will work
# make sure your variables are already defined using "define_variables.R"

# replace the blank with the cleaned data frame name 
mydf  |>  
  # remove missing values from continuous variables
  filter(!is.na(.data[[cont_var]])) |> 
  
  #this groups by a defined set of between and within subjects factors
  #remove factors as needed
  group_by(.data[[w_factor]], .data[[b_factor]] )  |> 
  
  #calculate the rounded values
  summarise(SD = signif(sd(.data[[cont_var]]), digits=2))