# to use this code, the following packages must be loaded
# tidyverse
# gt


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
  # the SD is rounded to 2 significant digits using signif  
  # do not place anything in the empty parentheses in the n() 
  # N represents the sample size within each group
  summarise(Mean = round(mean(.data[[cont_var]]), digits=__), 
            SD = signif(sd(.data[[cont_var]]), digits=2),
            N = n()) |> 
  ungroup()

gt(df_sum)

