#make sure `ggstats` is installed
# make sure your variables are already defined using "define_variables.R"

#first we need to change the format of the data from long to wide
#this way, we will have one row for each subject and can take a difference
#between the after and before values
mydf_wide  <- mydf |> 
  dplyr::select(.data[[subject_ID]], .data[[b_factor]], .data[[w_factor]], .data[[cont_var]]) |> 
  pivot_wider(
    names_from = .data[[w_factor]],
    
    values_from = .data[[cont_var]]
  )

#next, take the difference between the values for each subject
#fill in the blank with the name of each treatment/group 
mydf_diff <- mydf_wide |> 
  mutate(change_cont_var = ___ - ___) |> 
  
  #add in the information from the subjects data spreadsheet
  left_join(subjects)

#change the numbers to reflect the number of options you had
likert_levels <- 1:5

#adjust the labels so they match what you want them to say
#and make sure they are in the same order as the numbers 
#(here 1 = very negative, 5 = very positive)
likert_labels <- c(
  "Very Negative",
  "Negative",
  "Neutral",
  "Positive",
  "Very Positive"
)

#relabel the factor with the above labels in the right order
#put the name of the factor in both of the blanks below
mydf_diff$___ <- factor(mydf_diff$___, 
                                    levels = likert_levels, 
                                    labels = likert_labels, 
                                    ordered = TRUE)


#If you don't need to relabel the factor from number to words 
#but you do need to just put the levels in the right order
#use the code below
#put the name of the factor in both of the blanks in the top line 
#fill in the levels with all the options in the right order 
#(add or subtract levels as needed)
mydf_diff$___ <- factor(mydf_diff$___, 
                        levels = c("___", 
                                   "___", 
                                   "___",
                                   "___",
                                   "___"))

#Give a better label to each of your factors
#Put the factor name in the first blank and 
#put the nicer label of the survey question in the second blank
mydf_diff <- mydf_diff |>
  set_variable_labels(_
    ___ = "____,
    ___ = "____,
    ___ = "____)


#create the graph of the survey data
#name the graph object something that you will remember 
#(this object name will go in the first and last blank)
#put the column name of each survey question of interest in the include statement blanks
#put the name of the between subjects factor in the facet_rows blank
___ <- ggstats::gglikert(mydf_diff, include = c(___, ___),
                          add_totals = FALSE,
                          y_label_wrap = 25,
                          facet_rows = vars(___))
___

