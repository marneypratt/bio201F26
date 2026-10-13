# the code below will calculate a repeated measures ANOVA
# this is for HRV data with 3 measurement blocks and repeated measures design
# to use this code, the following packages must be loaded
# tidyverse
# rstatix
# ggpubr
# your categorical variable must also be categorized as a factor


#First test assumptions to make sure Anova is appropriate 

#Test to see if each group has a normal distributed
#p-value should be greater than 0.05 if normal
#replace each blank with the item indicated by comment to the right
__ |> #dataframe
  group_by(___)  |>          #within subjects factor column name
  rstatix::shapiro_test(___) #dependent continuous variable

ggpubr::ggqqplot(df, "___",           #dependent continuous variable
                 facet.by = "___")  #within subjects factor column name

#test for outliers
__ |> #dataframe
  group_by(___)  |>   #within subjects factor column name
  rstatix::identify_outliers(___)  #dependent continuous variable

#avoids scientific notation
options(scipen = 99)

# Perform Repeated Measures ANOVA with the rstatix package
rm_anova <- 
  rstatix::anova_test(
    data = ___,       #dataframe 
    dv = ___,         #dependent continuous variable
    wid = ___,        #subjects column
    within = ___,     #within subjects factor column name
    type = 3)         #type of Anova model


# Print the results
get_anova_table(rm_anova)


# We are comparing to an F-distribution (F-test) here 
# DFn indicates the degrees of freedom in the numerator 
# DFd indicates the degrees of freedom in the denomerator 
# F is the F-statistic value
# p specifies the p-value
# ges is the generalized effect size (amount of variability due to the within-subjects factor)

# pairwise comparisons
pwc <- ___  |>   #dataframe
  pairwise_t_test(
    ___ ~ ___,       # dependent var ~ within subjects factor column name
    paired = TRUE,  
    p.adjust.method = "bonferroni"
  )

as.data.frame(pwc)

#create base plot of data
repeated.plot <- ggplot(___,                  #dataframe
             aes(x=___,            #within subjects factor column name
                 y=___,            #dependent continuous variable
                 group = `___`)) + #subjects column
  geom_point(size = 2, shape = 21, fill = "steelblue", alpha = 0.5) +
  geom_line(linewidth = 0.2, alpha = 0.5) + 
  stat_summary(fun = median, fun.min = median, fun.max = median, 
               geom = "crossbar", width = 0.2, size = 1,
               aes(group = '___' )) +   #within subjects factor column name
  xlab("___") +   #label for within subjects factor (can have spaces)
  ylab("___") +   #label for dependent variable (can have spaces, include units)
  theme_classic(base_size=18) 

# Visualization: plot with p-values
pwc <- pwc  |> 
  add_xy_position(x = "___")  #within subjects factor column name
repeated.plot + 
  stat_pvalue_manual(pwc) +
  labs(
    subtitle = get_test_label(rm_anova, detailed = TRUE),
    caption = get_pwc_label(pwc)
  )