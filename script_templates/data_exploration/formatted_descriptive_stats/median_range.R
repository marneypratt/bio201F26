# to use this code, the following packages must be loaded
# tidyverse
# flextable
#see https://davidgohel.github.io/flextable/ for more info & formatting options

# replace the blank below with a continuous variable you want to summarize
cont_var <- "___" 

#calculate descriptive stats
#replace the blank below with the name of the dataframe
df_sum <- ___ |> 
  
  # replace the blank with the categorical variable(s)
  group_by(___) |> 
  
  # remove missing values 
  filter(!is.na(.data[[cont_var]])) |> 
  
  # calculate the descriptive stats
  # replace the blanks with the number of digits 
  # to the right of the decimal place based on the rounded SD
  # do not place anything in the empty parentheses in the n() 
  # N represents the sample size within each group
  summarise(Median = round(median(.data[[cont_var]]), digits=__),
            min = round(min(.data[[cont_var]]), digits=__),
            max = round(max(.data[[cont_var]]), digits=__),
            N = n()) |> 
  mutate(Range = paste(min, max, sep = "-")) |> 
  dplyr::select(-min, -max) |> 
  relocate(N, .after = last_col())|> 
  ungroup()

gt(df_sum)