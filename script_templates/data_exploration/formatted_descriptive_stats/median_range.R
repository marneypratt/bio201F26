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
            min = round(min(.data[[cont.var]]), digits=__),
            max = round(max(.data[[cont.var]]), digits=__),
            N = n()) |> 
  mutate(Range = paste(min, max, sep = "-")) |> 
  dplyr::select(-min, -max) |> 
  relocate(N, .after = last_col())


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