# the code below will calculate descriptive statistics for a variable of interest grouped by another variable
# the dplyr package must be loaded before this will work
# make sure your variables are already defined using "define_variables.R"


# Use the following for digits in the `round` function
# 
#    rounding to the tens place use digits=-1
#    rounding to the ones place use digits=0
#    rounding to the tenths place use digits=1
#    rounding to the hundredths place use digits=2

#set the number of digits to round to based on the rules above (this blank should be just a number)
round_digit <- ___


# replace the blank with the cleaned data frame name 
mydf  |>  
  # remove missing values from continuous variables
  filter(!is.na(.data[[cont_var]])) |> 
  
  #this groups by a defined set of within subjects factors
  group_by(.data[[w_factor]])  |> 
  
  # calculate the descriptive stats
  # do not place anything in the empty parentheses in the n() 
  summarize(Sample_size = n(),
            Min = round(min(.data[[cont_var]]), digits=round_digit),
            Q1 = round(quantile(.data[[cont_var]], .25), digits=round_digit),
            Median = round(median(.data[[cont_var]]), digits=round_digit),
            Q3 = round(quantile(.data[[cont_var]], .75), digits=round_digit),
            Max = round(max(.data[[cont_var]]), digits=round_digit),
            Mean = round(mean(.data[[cont_var]]), digits=round_digit),              
            SD = signif(sd(.data[[cont_var]]), digits=2))
