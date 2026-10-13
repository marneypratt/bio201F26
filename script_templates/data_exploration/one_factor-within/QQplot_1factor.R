## make sure to have the ggpubr package loaded and variables defined to get this code to run


#make a QQ plot for each dependent variable that is continuous
ggpubr::ggqqplot(
  data = my.df,               #put the data frame name here 
  x = {{ cont.var }},                  #put the continuous variable name here
  color = {{ w.factor.var }} #put the within subjects factors here (remove if no factors)
)   