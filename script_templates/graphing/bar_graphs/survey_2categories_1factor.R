#make sure `ggstats` is installed
# make sure your variables are already defined using "define_variables.R"

#first we need to change the format of the data from long to wide
#this way, we will have one row for each subject and can take a difference
#between the after and before values
mydf_wide  <- mydf |> 
  dplyr::select(.data[[subject_ID]], .data[[w_factor]], .data[[cont_var]]) |> 
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


#Make sure your options are in the right order
#put the name of the factor in both of the blanks in the top line 
mydf_diff$___ <- factor(mydf_diff$___, 
                        levels = c("No", "Yes"))

#Give a better label to each of your factors
#Put the factor name in the first blank and 
#put the nicer label of the survey question in the second blank
mydf_diff <- mydf_diff |>
  set_variable_labels(
    ___ = "____,
    ___ = "____,
    ___ = "____)


#create the graph of the survey data
#name the graph object something that you will remember 
#(this object name will go in the first and last blank)
#put the column name of each survey question of interest in the include statement blanks

___ <- ggstats::gglikert(mydf_diff, 
                          include = c(___, ___),  #survey Q column names
                          add_totals = FALSE,
                          y_label_wrap = 25,
                          labels_color = "black") +  #between subjects factor
       
       #change the colors below as you like, 
       #but make sure they are color-blind friendly                   
       scale_fill_manual(values = c("#C8B0D9", "#7DBA8A"))
    
___

