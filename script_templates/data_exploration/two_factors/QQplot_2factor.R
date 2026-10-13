## make sure to have the ggpubr package loaded and variables defined to get this code to run


#make a QQ plot for each dependent variable that is continuous
ggpubr::ggqqplot(
  data = my.df,               #put the data frame name here 
  x = {{ cont.var }},                  #put the continuous variable name here
  color = {{ b.factor.var }},       #put the between subjects factor here (remove if no factors)
  facet.by = {{ w.factor.var }}  #put the within subjects factors here (remove if no factors)
)   