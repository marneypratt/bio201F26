# to use this code, the following packages must be loaded
# tidyverse
# gt
# make sure your variables are already defined using "define_variables.R"


#calculate descriptive stats
f_sum <- mydf |> 
  
  # adjust the categorical variable(s) as needed
  group_by(.data[[b_factor]], .data[[w_factor]]) |> 
  
  # remove missing values 
  filter(!is.na(.data[[cont_var]])) |> 
  
  # calculate the descriptive stats
  # do not place anything in the empty parentheses in the n() 
  # N represents the sample size within each group
  summarise(Mean = round(mean(.data[[cont_var]]), digits=round_digit), 
            SD = signif(sd(.data[[cont_var]]), digits=2),
            N = n()) |> 
  ungroup()

gt(df_sum)

