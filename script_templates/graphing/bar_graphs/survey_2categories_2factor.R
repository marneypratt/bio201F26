#make sure `ggstats` is installed

#first we need to change the format of the data from long to wide
#this way, we will have one row for each subject and can take a difference
#between the after and before values
my.df.wide  <- my.df |> 
  dplyr::select(.data[[subject.ID]], .data[[b.factor.var]], .data[[w.factor.var]], .data[[cont.var]]) |> 
  pivot_wider(
    names_from = .data[[w.factor.var]],
    
    values_from = .data[[cont.var]]
  )

#next, take the difference between the values for each subject
#fill in the blank with the name of each treatment/group 
my.df.diff <- my.df.wide |> 
  mutate(change.cont.var = ___ - ___) |> 
  
  #add in the information from the subjects data spreadsheet
  left_join(subjects)


#Make sure your options are in the right order
#put the name of the factor in both of the blanks in the top line 
my.df.diff$___ <- factor(my.df.diff$___, 
                        levels = c("No", "Yes"))

#Give a better label to each of your factors
#Put the factor name in the first blank and 
#put the nicer label of the survey question in the second blank
my.df.diff <- my.df.diff |>
  set_variable_labels(_
    ___ = "____,
    ___ = "____,
    ___ = "____)


#create the graph of the survey data
#name the graph object something that you will remember 
#(this object name will go in the first and last blank)
#put the column name of each survey question of interest in the include statement blanks
#put the name of the between subjects factor in the facet_rows blank

___ <- ggstats::gglikert(my.df.diff, 
                          include = c(___, ___),  #survey Q column names
                          add_totals = FALSE,
                          y_label_wrap = 25,
                          labels_color = "black",
                          facet_rows = vars(___)) +  #between subjects factor
       
       #change the colors below as you like, 
       #but make sure they are color-blind friendly                   
       scale_fill_manual(values = c("#C8B0D9", "#7DBA8A"))
    
___

