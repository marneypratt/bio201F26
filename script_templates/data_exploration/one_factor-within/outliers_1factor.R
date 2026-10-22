## make sure to have the rstatix package loaded  
# make sure your variables are already defined using "define_variables.R"



#test for outliers
mydf  |> 
  
  #this groups by a defined set of within subjects factors
  #remove factors as needed
  group_by(.data[[w_factor]])  |> 
  
  
  rstatix::identify_outliers({{ cont_var }}) 