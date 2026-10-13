#use this code to make a 1 factor repeated measures plot 
#with one within subjects factor and repeated measures Anova results included
#the ggplot2, rstatix, and ggpubr packages must be loaded for this code to work


# Perform Repeated Measures ANOVA with the rstatix package
rm_anova <- 
  rstatix::anova_test(
    data = ___,     #dataframe 
    dv = ___,       #continuous dependent variable column name
    wid = ___,      #subjects column
    within = ___,   #within subjects factor column name 
    type = 3)       #type of Anova model

# Print the results
get_anova_table(rm_anova)

# pairwise comparisons of levels for the within subjects factor
pwc <- 
  ___  |>   #dataframe name
  pairwise_t_test(
    ___ ~ ___, #1st blank=dependent variable, 2nd=factor column name
    paired = TRUE,       
    p.adjust.method = "bonferroni"
  )

as.data.frame(pwc)

#create base plot of data
repeated.plot <- ggplot(
  data = ___,           #data frame name
  aes(
    y = ___,            #continuous dependent variable column name
    x = ___,            #within subjects factor column name
    group = `___`)) +  #subjects column name
  geom_point(size = 2, shape = 21, fill = "steelblue", alpha = 0.5) +
  geom_line(linewidth = 0.2, alpha = 0.5) + 
  
  ###this bit of code adds the horizontal bar 
  ###keep as median or change to mean
  stat_summary(fun = median, fun.min = median, fun.max = median, 
               geom = "crossbar", width = 0.2, size = 1,
               aes(group = '___' )) + #within subjects factor column name
  
  
  xlab("___") +  #within subjects factor label
  ylab("___") + #dependent variable label with units
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
