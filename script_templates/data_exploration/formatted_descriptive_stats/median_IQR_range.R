# to use this code, the following packages must be loaded
# tidyverse
# flextable


#see https://davidgohel.github.io/flextable/ for more info & formatting options

# replace the blank below with a continuous variable you want to summarize
cont.var <- "___" 

#calculate descriptive stats
#replace the blank below with the name of the dataframe
df.sum <- ___ |> 
  
  # replace the blank with the categorical variable(s)
  group_by(___) |> 
  
  # remove missing values 
  filter(!is.na(.data[[cont.var]])) |> 
  
  # calculate the descriptive stats
  # replace the blanks with the number of digits 
  # to the right of the decimal place based on the rounded SD
  # do not place anything in the empty parentheses in the n() 
  # N represents the sample size within each group
  summarise(Median = round(median(.data[[cont.var]]), digits=__),
            Q1 = round(quantile(.data[[cont.var]], .25), digits=__),
            Q3 = round(quantile(.data[[cont.var]], .75), digits=__),
            Min = round(min(.data[[cont.var]]), digits=__),
            Max = round(max(.data[[x.var]]), digits=__),
            N = n()) |> 
  mutate(IQR = paste(Q1, Q3, sep = "-")) |> 
  mutate(Range = paste(Min, Max, sep = "-")) |> 
  dplyr::select(-Min, -Max) |> 
  dplyr::select(-Q1, -Q3) |> 
  relocate(N, .after = last_col()) |> 
  relocate(IQR, .after = Median)

library(flextable) #helps format a nicer table

#create the formatted table
ft <- flextable(df.sum,
                cwidth = 0.75) |>  #can vary cell width as needed
  
  #bold the headings
  bold(part = "header") |> 
  
  #center columns & autofit
  align(align = "center", part = "all" ) |> 
  set_table_properties(layout = "autofit")

#print the table
#right click on the table, choose select all, 
#choose copy, then paste in your document
#finish formatting as needed in your document
ft