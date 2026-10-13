# the code below will calculate descriptive statistics for a variable of interest grouped by another variable
# the dplyr package must be loaded before this will work
# the variables included here need to be defined to get this code to run


# Use the following for digits in the `round` function
# 
#    rounding to the tens place use digits=-1
#    rounding to the ones place use digits=0
#    rounding to the tenths place use digits=1
#    rounding to the hundredths place use digits=2

#set the number of digits to round to based on the rules above (this blank should be just a number)
round.digit <- ___


# replace the blank with the cleaned data frame name 
my.df  |>  
  # remove missing values from continuous variables
  filter(!is.na(.data[[cont.var]])) |> 
  
  #this groups by a defined set of within subjects factors
  group_by(.data[[w.factor.var]])  |> 
  
  # calculate the descriptive stats
  # do not place anything in the empty parentheses in the n() 
  summarize(Sample.size = n(),
            Min = round(min(.data[[cont.var]]), digits=round.digit),
            Q1 = round(quantile(.data[[cont.var]], .25), digits=round.digit),
            Median = round(median(.data[[cont.var]]), digits=round.digit),
            Q3 = round(quantile(.data[[cont.var]], .75), digits=round.digit),
            Max = round(max(.data[[cont.var]]), digits=round.digit),
            Mean = round(mean(.data[[cont.var]]), digits=round.digit),              
            SD = signif(sd(.data[[cont.var]]), digits=2))
