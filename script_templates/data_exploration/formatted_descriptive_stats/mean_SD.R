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
  # the SD is rounded to 2 significant digits using signif  
  # do not place anything in the empty parentheses in the n() 
  # N represents the sample size within each group
  summarise(Mean = round(mean(.data[[cont.var]]), digits=__), 
            SD = signif(sd(.data[[cont.var]]), digits=2),
            N = n())

library(flextable) #helps format a nicer table

#create the formatted table
ft <- flextable(df.sum,
                cwidth = 0.75) |>  #can vary cell width as needed
  
  #bold the headings
  bold(part = "header") |> 
  
  #center columns
  align(align = "center", part = "all" )

#print the table
#right click on the table, choose select all, 
#choose copy, then paste in your document
#finish formatting as needed in your document
ft