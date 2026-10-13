# the code below will calculate descriptive statistics for a variable of interest grouped by another variable
# the dplyr package must be loaded before this will work
# the variables included here need to be defined to get this code to run


df.sum <- my.df  |>  
  # remove missing values from continuous variables
  filter(!is.na(.data[[cont.var]])) |> 
  
  #this groups by a defined set of within subjects factors
  group_by(.data[[w.factor.var]])  |> 
  
  # calculate the descriptive stats
  # you don't need to change anything below 
  # leave the parentheses for n() empty
  summarize(Mean = mean(.data[[cont.var]]), 
            Median = median(.data[[cont.var]]), 
            SD = sd(.data[[cont.var]]), 
            IQR = IQR(.data[[cont.var]]), 
            Min = min(.data[[cont.var]]),
            Max = max(.data[[cont.var]]),
            Sample.size = n())

df.sum