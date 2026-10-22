# to use this code, the following packages must be loaded
# tidyverse
# gt
# make sure your variables are already defined using "define_variables.R"


# Use the following for digits in the `round` function
# 
#    rounding to the tens place use digits=-1
#    rounding to the ones place use digits=0
#    rounding to the tenths place use digits=1
#    rounding to the hundredths place use digits=2

#set the number of digits to round to based on the rules above (this blank should be just a number)
round_digit <- ___


#calculate descriptive stats
df_sum <- mydf |> 
  
  # adjust the categorical variable(s) as needed
  group_by(.data[[b_factor]], .data[[w_factor]]) |> 
  
  # remove missing values 
  filter(!is.na(.data[[cont_var]])) |> 
  
  # calculate the descriptive stats
  # do not place anything in the empty parentheses in the n() 
  # N represents the sample size within each group
  summarise(Median = round(median(.data[[cont_var]]), digits=round_digit),
            Q1 = round(quantile(.data[[cont_var]], .25), digits=round_digit),
            Q3 = round(quantile(.data[[cont_var]], .75), digits=round_digit),
            min = round(min(.data[[cont_var]]), digits=round_digit),
            max = round(max(.data[[cont_var]]), digits=round_digit),
            N = n()) |> 
  mutate(IQR = paste(Q1, Q3, sep = "-")) |> 
  dplyr::select(-Q1, -Q3) |> 
  relocate(N, .after = last_col())|> 
  ungroup()

gt(df_sum)