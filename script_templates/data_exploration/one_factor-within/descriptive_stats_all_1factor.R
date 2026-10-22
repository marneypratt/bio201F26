# the code below will calculate descriptive statistics for a variable of interest grouped by another variable
# the dplyr package must be loaded before this will work
# make sure your variables are already defined using "define_variables.R"


mydf_sum <- mydf  |>  
  # remove missing values from continuous variables
  filter(!is.na(.data[[cont_var]])) |> 
  
  #this groups by a defined set of within subjects factors
  group_by(.data[[w_factor]])  |> 
  
  # calculate the descriptive stats
  # you don't need to change anything below 
  # leave the parentheses for n() empty
  summarize(Mean = mean(.data[[cont_var]]), 
            Median = median(.data[[cont_var]]), 
            SD = sd(.data[[cont_var]]), 
            IQR = IQR(.data[[cont_var]]), 
            Min = min(.data[[cont_var]]),
            Max = max(.data[[cont_var]]),
            Sample.size = n())

mydf_sum