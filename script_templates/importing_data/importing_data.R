#make sure the readr and labelled packages are loaded before using this code template

#Import data files

#replace the blank below with the name of your HRV data
#make sure that you put the .csv file into data folder
my.df <- read_csv("data/___.csv",
                  show_col_types = FALSE)

#Change independent categorical variables to factors
#replace the blanks after my.df$ with the column name of the 
#independent categorical variable 
#(make sure to use the same column name on the same line)
#replace the blanks in quotes with the levels within each column
#make sure you put the levels in the right order 
#for example 
#my.df$time.measured <- factor(my.df$time.measured, levels = c("Before", "After"))
my.df$___ <- factor(my.df$___, 
                    levels = c("___", "___"))
my.df$___ <- factor(my.df$___, 
                    levels = c("___", "___"))

#replace the blank below with the name of your subjects data
#make sure that you put the .csv file into data folder
subjects <- read_csv("data/___.csv")


#replace the blank below with the name of your metadata file
##make sure that you put the .csv file into data folder
metadata <- read_csv("data/____.csv")


#create variable labels using the labelled package
variable_labels <- metadata |> 
  select(variable, variable_label) |> 
  deframe()

#add labels to data
my.df <- my.df |> 
  left_join(subjects) |> 
  set_variable_labels(!!!variable_labels)


# for more help with labeling data see   
# https://www.pipinghotdata.com/posts/2022-09-13-the-case-for-variable-labels-in-r/    