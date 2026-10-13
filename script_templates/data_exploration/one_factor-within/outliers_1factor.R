## make sure to have the rstatix package loaded  
## and the variables defined to get this code to run



#test for outliers
my.df  |> 
  
  #this groups by a defined set of within subjects factors
  #remove factors as needed
  group_by(.data[[w.factor.var]])  |> 
  
  
  rstatix::identify_outliers({{ cont.var }}) 