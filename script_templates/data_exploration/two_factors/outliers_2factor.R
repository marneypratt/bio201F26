## make sure to have the rstatix package loaded  
## and the variables defined to get this code to run



#test for outliers
mydf  |> 
  
  #this groups by a defined set of between and within subjects factors
  #remove factors as needed
  group_by(.data[[w_factor]], .data[[b_factor]] )  |> 
  
  
  rstatix::identify_outliers({{ cont_var }}) 