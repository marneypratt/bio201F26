#the code below uses the rstatix package to complete a 2-way mixed ANOVA
#in this code, one factor is within subjects, and the other factor is between


#First test assumptions to make sure Anova is appropriate 

#Test to see if each group has a normal distributed
#p-value should be greater than 0.05 if normal
my.df  |> 
  group_by(___,              #within subjects factor column name
           ___)  |>          #between subjects factor column name
  rstatix::shapiro_test(___) #dependent variable column name

#qq plots
#points should be fairly close to the line if normal
ggpubr::ggqqplot(my.df, "___") +     #dependent variable column name
  facet_grid(
    ___ ~ ___) #1st blank = within subjects factor column name 
               #2nd blank = between subjects factor column name


#test for outliers
my.df  |> 
  group_by(___,              #within subjects factor column name
           ___)  |>          #between subjects factor column name
  rstatix::identify_outliers(___) #dependent variable column name

#test for homogeneity of variance
##p-value should be greater than 0.05 if variance is homogeneous
my.df |> 
  group_by(___) |>           #within subjects factor column name
  levene_test(___ ~ ___)  #1st blank = dependent variable column name
                          #2nd blank = between subjects factor column name


#avoids scientific notation
options(scipen = 99)

# Perform 2-way mixed ANOVA with the rstatix package
mixed_anova <- rstatix::anova_test(
  data = ___,   #dataframe 
  dv = ___,   #dependent variable column
  wid = ___,  #subjects column
  between = ___,    #between-subjects factor variable
  within = ___)  #within-subjects factor variable 

# Print the results as a dataframe
mixed_anova.table <- 
  as.data.frame(get_anova_table(mixed_anova))
mixed_anova.table

#save the results as a csv file
write_csv(mixed_anova.table, "results/mixed_anova.table.csv")

# We are comparing to an F-distribution (F-test) here 
# DFn indicates the degrees of freedom in the numerator 
# DFd indicates the degrees of freedom in the denomenator 
# F is the F-statistic value
# p specifies the p-value
# ges is the generalized effect size 